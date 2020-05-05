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
    var posts: [Post] = [] {
        didSet {
            if posts.count > 0 {
                view?.showList(posts)
            } else {
                view?.showNoContent()
            }
        }
    }

    func viewDidLoad() {
        interactor.fetchPosts()
    }

    func pushPostViewController() {
        router.pushPostViewController()
    }
}

extension ListPresenter: ListInteractorOutput {
    func postsFetched(_ posts: [Post]) {
        self.posts = posts
    }

    func postsFetchFailed(_ error: Error) {
        print("💩 error : \(error) \n")
    }
}
