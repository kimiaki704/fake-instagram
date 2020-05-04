//
//  ListInteractor.swift
//  FakeInstagram
//
//  Created by 鈴木 公章 on 2020/05/05.
//

import Model

class ListInteractor: ListUseCase {
    weak var output: ListInteractorOutput!

    func fetchPosts() {
        output.postsFetched(Post.mockPosts())
    }
}
