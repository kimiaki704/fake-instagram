//
//  PostRouter.swift
//  FakeInstagram
//
//  Created by 鈴木 公章 on 2020/05/06.
//

import Model
import UIKit

class PostRouter: PostWireframe {
    static var appResolver: Resolver { Resolver.shared }
    weak var viewController: UIViewController?

    static func assembleModule() -> UIViewController {
        let view = appResolver.resolvePostViewController()
        let presenter = appResolver.resolvePostPresenter()
        let interactor = appResolver.resolvePostInteractor()
        let router = appResolver.resolvePostRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view

        return view
    }
}
