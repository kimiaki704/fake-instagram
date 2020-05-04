//
//  RootRouter.swift
//  FakeInstagram
//
//  Created by 鈴木 公章 on 2020/05/04.
//

import UIKit

class RootRouter: RootWireframe {
    static var appResolver: Resolver { Resolver.shared }

    func presentListViewController(in window: UIWindow) {
        window.makeKeyAndVisible()
        #warning("TODO: window rootViewControllerにListRouter　assembleModuleいれる")
    }
}
