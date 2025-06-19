//
//  StoriesItemCell .swift
//  InstagramFeedUI
//
//  Created by murad on 17.06.2025.
//

import UIKit
import SnapKit

final class StoriesItemCell: UICollectionViewCell {
    //MARK: - Private properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.imageSize / 2
        view.clipsToBounds = true
        return view
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.usernameFontSize)
        label.textAlignment = .center
        return label
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(.addStoryButton, for: .normal)
        //button.addTarget(self, action: #selector(plusTapped), for: .touchUpInside)
        return button
    }()
    
    private let circleImageView: UIImageView = {
        let view = UIImageView()
        view.image = .storyRing
        return view
    }()
    
    private enum UIConstants {
        static let imageSize: CGFloat = 60
        static let imageToCellInset: CGFloat = 6
        static let labelToCellInset: CGFloat = 6
        static let imageToLabelOffset: CGFloat = 6
        static let usernameFontSize: CGFloat = 11.5
        static let plusButtonSize: CGFloat = 20
        static let circleSize: CGFloat = 72
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public methods
    func configure(with info: FeedStoriesItemCellInfo) {
        imageView.image = info.image
        usernameLabel.text = info.username
        plusButton.isHidden = !info.isAddButtonVisible
        circleImageView.isHidden = !info.isNewStory
    }
}

//MARK: - Private methods
private extension StoriesItemCell {
    func initialize() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.imageSize)
            make.leading.top.trailing.equalToSuperview().inset(UIConstants.imageToCellInset)
        }
        
        contentView.addSubview(usernameLabel)
        usernameLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(UIConstants.labelToCellInset)
            make.top.equalTo(imageView.snp.bottom).offset(UIConstants.imageToLabelOffset)
        }
        
        contentView.addSubview(plusButton)
        plusButton.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(imageView)
            make.size.equalTo(UIConstants.plusButtonSize)
        }
        
        contentView.addSubview(circleImageView)
        circleImageView.snp.makeConstraints { make in
            make.center.equalTo(imageView)
            make.size.equalTo(UIConstants.circleSize)
        }
    }
    
    @objc func plusTapped() {
        print("Plus tapped")
    }
}
