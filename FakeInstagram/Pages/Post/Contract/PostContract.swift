//
//  PostContract.swift
//  FakeInstagram
//
//  Created by 鈴木 公章 on 2020/05/05.
//

import Model
import UIKit

protocol PostView: class {
    var presenter: PostPresentation! { get set }

    func posted(_ post: Post)
    func postFailed()
}

protocol PostPresentation: class {
    var view: PostView? { get set }
    var interactor: PostUseCase! { get set }
    var router: PostWireframe! { get set }

    func post(_ post: Post)
}

protocol PostUseCase: class {
    var output: PostInteractorOutput! { get set }
    func post(_ post: Post)
}

protocol PostInteractorOutput: class {
    func posted(_ string: String)
    func postFailed(_ error: Error)
}

protocol PostWireframe: class {
    static var appResolver: Resolver { get }
    var viewController: UIViewController? { get set }
    static func assembleModule() -> UIViewController
}
