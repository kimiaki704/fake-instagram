//
//  Comment.swift
//  Model
//
//  Created by 鈴木 公章 on 2020/05/05.
//

public struct Comment {
    public var id: String
    public let postID: String
    public let user: User
    public var text: String
    public var likeCount: Int
    public var createdAt: String

    init(id: String,
         postID: String,
         user: User,
         text: String,
         likeCount: Int,
         createdAt: String) {
        self.id = id
        self.postID = postID
        self.user = user
        self.text = text
        self.likeCount = likeCount
        self.createdAt = createdAt
    }

    static func mockComments() -> [Comment] {
        [Comment(id: "1", postID: "1", user: User.mockUsers()[0], text: "コメント１。コメント１。コメント１。", likeCount: 12, createdAt: "15:00 2020-05-05"),
         Comment(id: "2", postID: "2", user: User.mockUsers()[0], text: "コメント２。コメント２。コメント２。コメント２。コメント２。コメント２。", likeCount: 34, createdAt: "16:00 2020-05-05"),
         Comment(id: "3", postID: "3", user: User.mockUsers()[0], text: "コメント３。", likeCount: 56, createdAt: "17:00 2020-05-05"),
         Comment(id: "4", postID: "3", user: User.mockUsers()[1], text: "コメント４。コメント４。コメント４。コメント４。コメント４。", likeCount: 78, createdAt: "18:00 2020-05-05"),
         Comment(id: "5", postID: "3", user: User.mockUsers()[1], text: "コメント５。コメント５。", likeCount: 90, createdAt: "19:00 2020-05-05"),
         Comment(id: "6", postID: "4", user: User.mockUsers()[1], text: "コメント６。コメント６。コメント６。コメント６。コメント６。コメント６。コメント６。", likeCount: 150, createdAt: "20:00 2020-05-05")]
    }
}
