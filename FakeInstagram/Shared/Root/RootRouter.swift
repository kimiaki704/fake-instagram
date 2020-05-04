//
//  RootRouter.swift
//  FakeInstagram
//
//  Created by 鈴木 公章 on 2020/05/04.
//

import UIKit

class RootRouter: RootWireframe {
    func presentListViewController(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = ListRouter.assembleModule()
    }
}
