//
//  ListPresenter.swift
//  FakeInstagram
//
//  Created by 鈴木 公章 on 2020/05/05.
//

import Model

class ListPresenter: ListPresentation {
    var view: ListView?
    var interactor: ListUseCase!
    var router: ListWireframe!
    var posts: [Post] = []

    func viewDidLoad() {
        interactor.fetchPosts()
    }
}

extension ListPresenter: ListInteractorOutput {
    func postsFetched(_ posts: [Post]) {
        print("💩 posts : \(posts) \n")
    }

    func postsFetchFailed(_ error: Error) {
        print("💩 error : \(error) \n")
    }
}
