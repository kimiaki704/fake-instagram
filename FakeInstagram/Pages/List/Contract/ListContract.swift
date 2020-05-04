//
//  ListContract.swift
//  FakeInstagram
//
//  Created by 鈴木 公章 on 2020/05/04.
//

import UIKit

protocol ListView: class {
    var presenter: ListPresentation! { get set }
}

protocol ListPresentation: class {
    var view: ListView? { get set }
    var interactor: ListUseCase! { get set }
    var router: ListWireframe! { get set }

    func viewDidLoad()
}

protocol ListUseCase: class {
    var output: ListInteractorOutput! { get set }
}

protocol ListInteractorOutput: class {}

protocol ListWireframe: class {
    static var appResolver: Resolver { get }
    var viewController: UIViewController? { get set }
    static func assembleModule() -> UIViewController
}
