//
//  ViewControllerResolver.swift
//  FakeInstagram
//
//  Created by 鈴木 公章 on 2020/05/04.
//

import Component
import UIKit

extension Resolver {
    func resolveArticlesViewController() -> ArticlesListViewController {
        ArticlesListViewController.instantiate()
    }
}
