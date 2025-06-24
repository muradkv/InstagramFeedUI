//
//  FeedStroriesCellInfo.swift
//  InstagramFeedUI
//
//  Created by murad on 17.06.2025.
//

import UIKit

struct FeedStoriesItemCellInfo {
    let image: UIImage
    let username: String
    let isAddButtonVisible: Bool
    let isNewStory: Bool 
}

typealias FeedStoriesCellInfo = [FeedStoriesItemCellInfo]

//MARK: - Sample Data 
extension FeedStoriesItemCellInfo {
    static func makeSampleData() -> FeedStoriesCellInfo {
        return [
            FeedStoriesItemCellInfo(image: .lilyAva, username: "Lily", isAddButtonVisible: true, isNewStory: false),
            FeedStoriesItemCellInfo(image: .storie1, username: "Aloha", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: .storie2, username: "Debil", isAddButtonVisible: false, isNewStory: false),
            FeedStoriesItemCellInfo(image: .storie3, username: "Kuropa", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: .storie4, username: "Zhopa", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: .storie5, username: "YesYes", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: .storie6, username: "us$ser123", isAddButtonVisible: false, isNewStory: false)
        ]
    }
}
