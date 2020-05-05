//
//  PostViewController.swift
//  FakeInstagram
//
//  Created by 鈴木 公章 on 2020/05/05.
//

import Component
import Model
import UIKit

final class PostViewController: UIViewController, Instantiatable {
    @IBOutlet private var userImageView: UIImageView!
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var scrollViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet private var textView: PlaceholderTextView!
    @IBOutlet private var imagePreview: UIImageView!
    @IBOutlet private var imagePreviewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private var imageRemoveButton: UIButton!
    var rightBarButtonView: RightBarButtonView!
    var presenter: PostPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTextView()
        pickerSetup()
        imageViewSetup()
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
        rightBarButtonView = RightBarButtonView.loadViewFromNib()
        rightBarButtonView.setTitle("Post")
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBarButtonView)
        rightBarButtonView.actionButtonTapped = { [unowned self] in self.rightBarButtonTapped() }
    }

    private func rightBarButtonTapped() {
        presenter.post(Post.mockPosts()[0])
    }

    private func imageViewSetup() {
        #warning("TODO: UIImageを丸にするのがベストかな")
        imagePreview.layer.cornerRadius = 10
        imagePreview.layer.masksToBounds = true
        userImageView.loadImage(Post.mockPosts()[0].imageURL!, processors: [.circle])

        imagePreview.isHidden = true
        imageRemoveButton.isHidden = true
    }

    #warning("TODO: 外部で設定したい")
    #warning("TODO: ここでおそくなってる！")
    private func setupTextView() {
        let toolBar: UIView = UIView()
        toolBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 40)
        toolBar.backgroundColor = .white

        let selectPictureButton: UIButton = UIButton(type: .system)
        selectPictureButton.frame = CGRect(x: 5, y: 0, width: 40, height: 40)
        selectPictureButton.setImage(UIImage(systemName: "photo"), for: .normal)
        selectPictureButton.tintColor = UIColor(hex: "00FF7A")
        selectPictureButton.addTarget(self, action: #selector(pickerButtonTapped), for: .touchUpInside)
        toolBar.addSubview(selectPictureButton)

        let separater: UIView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 0.5))
        separater.backgroundColor = .gray
        toolBar.addSubview(separater)

        textView.inputAccessoryView = toolBar
        textView.delegate = self
        textView.becomeFirstResponder()
    }

    private func pickerSetup() {
        let picker = PostRouter.appResolver.resolveUIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
    }

    @objc private func pickerButtonTapped() {
        presenter.presentPickerController()
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

// MARK: ButtonAction

extension PostViewController {
    @IBAction private func removeButtonTapped(_ sender: UIButton) {
        imagePreview.image = nil
        imagePreview.isHidden = true
        imageRemoveButton.isHidden = true
    }
}

// MARK: UITextViewDelegate

extension PostViewController: UITextViewDelegate {
    public func textViewDidChange(_ textView: UITextView) {
        self.textView.sizeToFit()
        self.textView.togglePlaceholder()
        view.layoutIfNeeded()
    }
}

// MARK: Picker Delegate

extension PostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            #warning("TODO: post用に入れる")
            #warning("TODO: この計算をExtensionにしたい")
            let ratio = originalImage.size.height / originalImage.size.width
            imagePreviewHeightConstraint.constant = imagePreview.bounds.width * ratio
            imagePreview.image = originalImage
            imagePreview.isHidden = false
            imageRemoveButton.isHidden = false
        }
        presenter.dismissPickerController()
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        presenter.dismissPickerController()
    }
}
