//
//  PostViewController.swift
//  FakeInstagram
//
//  Created by 鈴木 公章 on 2020/05/05.
//

import Component
import UIKit

final class PostViewController: UIViewController, Instantiatable {
    var presenter: PostPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        title = "Post"
    }
}

extension PostViewController: PostView {
    func posted(_ string: String) {
        print("💩 success : \(string) \n")
    }

    func postFailed(_ error: Error) {
        print("💩 error : \(error) \n")
    }
}
