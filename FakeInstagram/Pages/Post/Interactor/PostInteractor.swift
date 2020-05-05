//
//  PostInteractor.swift
//  FakeInstagram
//
//  Created by 鈴木 公章 on 2020/05/06.
//

import Model

class PostInteractor: PostUseCase {
    var output: PostInteractorOutput!

    func post() {
        output.posted(Post.mockPosts()[0])
    }
}
