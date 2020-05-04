//
//  Post.swift
//  Model
//
//  Created by 鈴木 公章 on 2020/05/05.
//

import UIKit

public struct Post: Hashable {
    public var id: String
    public var user: User
    public var imageURL: String?
    public var text: String
    public var likeCount: Int = 0
    public var isLike = false
    public var createdAt: String

    init(id: String,
         user: User,
         imageURL: String?,
         text: String,
         likeCount: Int,
         isLike: Bool,
         createdAt: String) {
        self.id = id
        self.user = user
        self.imageURL = imageURL
        self.text = text
        self.likeCount = likeCount
        self.isLike = isLike
        self.createdAt = createdAt
    }

    public func hash(into hasher: inout Hasher) { hasher.combine(id) }
    public static func == (lhs: Post, rhs: Post) -> Bool { return lhs.id == rhs.id }

    public static func mockPosts() -> [Post] {
        [Post(id: "1",
              user: User.mockUsers()[0],
              imageURL: "https://d1d37e9z843vy6.cloudfront.net/jp/images/3551155/700/5ce9184effd0f73eb37bab3ff396a2dff87d0bb5.jpeg",
              text: "富士山。富士山。富士山。富士山。富士山。富士山。富士山。富士山。富士山。富士山。富士山。富士山。富士山。富士山。富士山。富士山。富士山。",
              likeCount: 35,
              isLike: false,
              createdAt: "2020-05-04 19:00:00"),
         Post(id: "2",
              user: User.mockUsers()[0],
              imageURL: "https://d1d37e9z843vy6.cloudfront.net/jp/images/3588497/700/f492da6bd20291c535e7297d66c0025b5b717f84.jpeg",
              text: "めっちゃ山。めっちゃ山。めっちゃ山。めっちゃ山。めっちゃ山。めっちゃ山。めっちゃ山。めっちゃ山。",
              likeCount: 10,
              isLike: false,
              createdAt: "2020-05-04 20:00:00"),
         Post(id: "3",
              user: User.mockUsers()[1],
              imageURL: "https://i.pinimg.com/474x/37/72/0a/37720a4aa54a6276d0656c160f5ed27c--okinawa-japan-the-florida-keys.jpg",
              text: "角島の橋。角島の橋。角島の橋。角島の橋。角島の橋。角島の橋。角島の橋。",
              likeCount: 125,
              isLike: true,
              createdAt: "2020-05-04 21:00:00"),
         Post(id: "4",
              user: User.mockUsers()[1],
              imageURL: "https://d340eiag32bpum.cloudfront.net/img/post/spot/235/23459-DKsqcCvQeSu4BhWsY2r4_lrg.jpg",
              text: "湖です。",
              likeCount: 60, isLike: false,
              createdAt: "2020-05-04 22:00:00")]
    }
}
