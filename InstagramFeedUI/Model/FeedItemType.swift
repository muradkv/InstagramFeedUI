//
//  FeedItemType.swift
//  InstagramFeedUI
//
//  Created by murad on 17.06.2025.
//

enum FeedItemType {
    case stories(FeedStoriesCellInfo)
    case post(FeedPostItemInfo)
}

extension FeedItemType {
    static func makeSampleData() -> [FeedItemType] {
        return [
            .stories(FeedStoriesItemCellInfo.makeSampleData()),
            .post(FeedPostItemInfo(
                userImage: .lilyAva,
                username: "Lily the Beauty",
                postSubtitle: "Elka",
                postImage: .lily,
                numberOfLikes: 24,
                comment: CommentShortInfo(username: "Lily", commentText: "Hellooooo. I am here and i would like to show you something good")
            )),
            .post(FeedPostItemInfo(
                userImage: .lilyAva,
                username: "Lily the Beauty",
                postSubtitle: "Elka",
                postImage: .lily1,
                numberOfLikes: 100,
                comment: CommentShortInfo(username: "Lily", commentText: "Ты чо ПЕС")
            )),
            .post(FeedPostItemInfo(
                userImage: .lilyAva,
                username: "Stinky ass",
                postSubtitle: "Elka",
                postImage: .lily2,
                numberOfLikes: 100,
                comment: CommentShortInfo(username: "Lily", commentText: "Look at you and look at me. Who is more beauty?")
            )),
            .post(FeedPostItemInfo(
                userImage: .lilyAva,
                username: "Lily the Beauty",
                postSubtitle: "Elka",
                postImage: .lily3,
                numberOfLikes: 100,
                comment: CommentShortInfo(username: "Lily", commentText: "Tell me your story and I`ll tell who you are")
            ))
        ]
    }
}
