//
//  FeedPostCell.swift
//  InstagramFeedUI
//
//  Created by murad on 17.06.2025.
//

import UIKit
import SnapKit

final class FeedPostCell: UITableViewCell {
    //MARK: - Private properties
    private let userImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.userImageSize / 2
        view.clipsToBounds = true
        return view
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.usernameLabelFontSize, weight: .bold)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.subtitleLabelFontSize)
        return label
    }()
    
    private let optionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let postImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        return button
    }()
    
    private let commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "bubble.right"), for: .normal)
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        return button
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.likesLabelFontSize, weight: .bold)
        return label
    }()
    
    private let commentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0 
        label.font = .systemFont(ofSize: UIConstants.commentLabelFontSize)
        return label
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public methods
    func configure(with info: FeedPostItemInfo) {
        userImageView.image = info.userImage
        usernameLabel.text = info.username
        subtitleLabel.text = info.postSubtitle
        postImageView.image = info.postImage
        likesLabel.text = "\(info.numberOfLikes) Likes"
        
        if let comment = info.comment {
            commentLabel.attributedText = makeCommentAttributedString(
                username: comment.username,
                commentText: comment.commentText
            )
        }
    }
}

//MARK: - Private methods
private extension FeedPostCell {
    func initialize() {
        selectionStyle = .none
        
        contentView.addSubview(userImageView)
        userImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalToSuperview().inset(UIConstants.userImageTopInset)
            make.size.equalTo(UIConstants.userImageSize)
        }
        
        let usernameStack = UIStackView()
        usernameStack.axis = .vertical
        usernameStack.addArrangedSubview(usernameLabel)
        usernameStack.addArrangedSubview(subtitleLabel)
        contentView.addSubview(usernameStack)
        usernameStack.snp.makeConstraints { make in
            make.centerY.equalTo(userImageView)
            make.leading.equalTo(userImageView.snp.trailing).offset(UIConstants.usernameStackToProfileImageOffset)
        }
        
        contentView.addSubview(optionsButton)
        optionsButton.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(UIConstants.contentInset)
        }
        
        contentView.addSubview(postImageView)
        postImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(userImageView.snp.bottom).offset(UIConstants.postImageToUserImageOffset)
            make.height.equalTo(contentView.snp.width)
        }
        
        let actionStack = UIStackView()
        actionStack.axis = .horizontal
        actionStack.spacing = UIConstants.actionsStackSpacing
        actionStack.addArrangedSubview(likeButton)
        actionStack.addArrangedSubview(commentButton)
        actionStack.addArrangedSubview(shareButton)
        contentView.addSubview(actionStack)
        actionStack.snp.makeConstraints { make in
            make.height.equalTo(UIConstants.actionsStackHeight)
            make.leading.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(postImageView.snp.bottom).offset(UIConstants.actionsStackToPostImageOffset )
        }
        likeButton.addTarget(self, action: #selector(likeTapped), for: .touchUpInside)
        
        contentView.addSubview(likesLabel)
        likesLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(actionStack.snp.bottom).offset(UIConstants.actionsStackToLikesLabelOffset)
        }
        
        contentView.addSubview(commentLabel)
        commentLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(likesLabel.snp.bottom).offset(UIConstants.commentToLikesOffset)
            make.bottom.equalToSuperview().inset(UIConstants.contentInset)
        }
    }
    
    @objc func likeTapped() {
        print("like tapped")
    }
    
    func makeCommentAttributedString(username: String, commentText: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        
        // username font (bold)
        let usernameAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: commentLabel.font.pointSize)
        ]
        let usernameString = NSAttributedString(string: username + " ", attributes: usernameAttributes)
        
        // commentText font (regular)
        let commentAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: commentLabel.font.pointSize)
        ]
        let commentString = NSAttributedString(string: commentText, attributes: commentAttributes)
        
        attributedString.append(usernameString)
        attributedString.append(commentString)
        
        return attributedString
    }
}

//MARK: - UIConstants

private extension FeedPostCell {
    enum UIConstants {
        static let userImageSize: CGFloat = 30
        static let contentInset: CGFloat = 12
        static let userImageTopInset: CGFloat = 6
        static let usernameLabelFontSize: CGFloat = 14
        static let subtitleLabelFontSize: CGFloat = 11
        static let usernameStackToProfileImageOffset: CGFloat = 12
        static let postImageToUserImageOffset: CGFloat = 6
        static let actionsStackHeight: CGFloat = 24
        static let actionsStackToPostImageOffset: CGFloat = 6
        static let actionsStackSpacing: CGFloat = 12
        static let actionsStackToLikesLabelOffset: CGFloat = 12
        static let likesLabelFontSize: CGFloat = 14
        static let commentLabelFontSize: CGFloat = 14
        static let commentToLikesOffset: CGFloat = 12
    }
}
