//
//  PostPresenter.swift
//  FakeInstagram
//
//  Created by 鈴木 公章 on 2020/05/06.
//

import Model

class PostPresenter: PostPresentation {
    var view: PostView?
    var interactor: PostUseCase!
    var router: PostWireframe!

    func post(_ post: Post) {
        interactor.post(post)
    }
}

extension PostPresenter: PostInteractorOutput {
    func posted(_ string: String) {
        view?.posted(string)
    }

    func postFailed(_ error: Error) {
        view?.postFailed(error)
    }
}
