//
//  RootWireframe.swift
//  FakeInstagram
//
//  Created by 鈴木 公章 on 2020/05/04.
//

import UIKit

protocol RootWireframe: class {
    static var appResolver: Resolver { get }
    func presentArticleListViewController(in window: UIWindow)
}
