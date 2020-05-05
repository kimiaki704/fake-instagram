//
//  ListRouter.swift
//  FakeInstagram
//
//  Created by 鈴木 公章 on 2020/05/05.
//

import Model
import UIKit

class ListRouter: ListWireframe {
    static var appResolver: Resolver { Resolver.shared }
    weak var viewController: UIViewController?

    static func assembleModule() -> UIViewController {
        let view = appResolver.resolveListViewController()
        let presenter = appResolver.resolveListPresenter()
        let interactor = appResolver.resolveListInteractor()
        let router = appResolver.resolveListRouter()
        let navigation = UINavigationController(rootViewController: view)
        navigation.navigationBar.tintColor = UIColor(hex: "00FF7A")

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view

        return navigation
    }

    func pushPostViewController() {
        let vc = PostRouter.assembleModule()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
