//
//  ListContract.swift
//  FakeInstagram
//
//  Created by 鈴木 公章 on 2020/05/04.
//

import Model
import UIKit

protocol ListView: class {
    var presenter: ListPresentation! { get set }

    func showList(_ posts: [Post])
    func showNoContent()
}

protocol ListPresentation: class {
    var view: ListView? { get set }
    var interactor: ListUseCase! { get set }
    var router: ListWireframe! { get set }

    func viewDidLoad()
    func pushPostViewController()
}

protocol ListUseCase: class {
    var output: ListInteractorOutput! { get set }
    func fetchPosts()
}

protocol ListInteractorOutput: class {
    func postsFetched(_ posts: [Post])
    func postsFetchFailed(_ error: Error)
}

protocol ListWireframe: class {
    static var appResolver: Resolver { get }
    var viewController: UIViewController? { get set }
    static func assembleModule() -> UIViewController
    func pushPostViewController()
}
