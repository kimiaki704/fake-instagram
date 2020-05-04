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
        let router = appResolver.resolveListRouter()

        let navigation = UINavigationController(rootViewController: view)

        router.viewController = view

        return navigation
    }
}
