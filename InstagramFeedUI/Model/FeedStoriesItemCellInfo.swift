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
            FeedStoriesItemCellInfo(image: .lily, username: "user123", isAddButtonVisible: true, isNewStory: false),
            FeedStoriesItemCellInfo(image: .lily, username: "user123", isAddButtonVisible: true, isNewStory: true),
            FeedStoriesItemCellInfo(image: .lily, username: "user123", isAddButtonVisible: true, isNewStory: false),
            FeedStoriesItemCellInfo(image: .lily, username: "user123", isAddButtonVisible: true, isNewStory: true),
            FeedStoriesItemCellInfo(image: .lily, username: "user123", isAddButtonVisible: true, isNewStory: true),
            FeedStoriesItemCellInfo(image: .lily, username: "user123", isAddButtonVisible: true, isNewStory: true),
            FeedStoriesItemCellInfo(image: .lily, username: "user123", isAddButtonVisible: true, isNewStory: true)
        ]
    }
}
