//
//  PresenterResolver.swift
//  FakeInstagram
//
//  Created by 鈴木 公章 on 2020/05/05.
//

extension Resolver {
    func resolveListPresenter() -> ListPresenter {
        ListPresenter()
    }

    func resolvePostPresenter() -> PostPresenter {
        PostPresenter()
    }
}
