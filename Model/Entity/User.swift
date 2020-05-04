//
//  User.swift
//  Model
//
//  Created by 鈴木 公章 on 2020/05/05.
//

public struct User: Equatable {
    public var id: String
    public var name: String
    public var email: String
    public var imageURL: String
    public var headerImageURL: String

    init(id: String,
         name: String,
         email: String,
         imageURL: String,
         headerImageURL: String) {
        self.id = id
        self.name = name
        self.email = email
        self.imageURL = imageURL
        self.headerImageURL = headerImageURL
    }

    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
            && lhs.name == rhs.name
            && lhs.email == rhs.email
            && lhs.imageURL == rhs.imageURL
            && lhs.headerImageURL == rhs.headerImageURL
    }

    static func mockUsers() -> [User] {
        let image1 = "https://pbs.twimg.com/media/CvAMjRTVMAA_qbx.jpg"
        let image2 = "https://scontent-lga3-1.cdninstagram.com/v/t51.2885-15/sh0.08/e35/c0.93.750.750a/s640x640/70235785_541547256606285_1892577763965236759_n.jpg?_nc_ht=scontent-lga3-1.cdninstagram.com&_nc_cat=109&_nc_ohc=fCkIvOzHqWkAX_PoZGo&oh=6dfe1e1b4210e550bc3cc33102e6ce06&oe=5EC65736"
        let headerImage1 = "https://pbs.twimg.com/media/DMWZfvuUQAATQPL.jpg"
        let headerImage2 = "https://images-na.ssl-images-amazon.com/images/I/51U414%2BaZDL._AC_SX466_.jpg"
        return [User(id: "f1", name: "Steave Jobs", email: "steave@info.com", imageURL: image1, headerImageURL: headerImage1),
                User(id: "f2", name: "Mark", email: "mark@info.com", imageURL: image2, headerImageURL: headerImage2)]
    }
}
