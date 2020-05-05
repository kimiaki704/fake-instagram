//
//  PostViewController.swift
//  FakeInstagram
//
//  Created by 鈴木 公章 on 2020/05/05.
//

import Component
import UIKit

final class PostViewController: UIViewController, Instantiatable {
    @IBOutlet private var userImageView: UIImageView!
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var scrollViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet private var textView: UITextView!
    @IBOutlet private var imagePreview: UIImageView!
    @IBOutlet private var imagePreviewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private var imageRemoveButton: UIButton!
    var presenter: PostPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }

    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: Any] else {
            return
        }
        guard let keyboardInfo = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardSize = keyboardInfo.cgRectValue.size
        scrollViewBottomConstraint.constant = keyboardSize.height
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
