//
//  LogoView.swift
//  InstagramFeedUI
//
//  Created by murad on 17.06.2025.
//

import UIKit
import SnapKit

final class LogoView: UIView {
    //MARK: - Private properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = .instagramLogo
        return view
    }()
    
    //MARK: - Private constants
    private enum UIConstants {
        static let logoWidth: CGFloat = 104
        static let logoHeight: CGFloat = 30
    }
    
    //MARK: - Init
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Private methods
private extension LogoView {
    func initialize() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(UIConstants.logoWidth)
            make.height.equalTo(UIConstants.logoHeight)
        }
    }
}
