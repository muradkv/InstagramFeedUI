//
//  FeedPostItemInfo.swift
//  InstagramFeedUI
//
//  Created by murad on 17.06.2025.
//

import UIKit

struct FeedPostItemInfo {
    let userImage: UIImage
    let username: String
    let postSubtitle: String
    let postImage: UIImage
    let numberOfLikes: Int
    let comment: CommentShortInfo? 
}

struct CommentShortInfo {
    let username: String
    let commentText: String
}
