//
//  ListCollectionViewCell.swift
//  Component
//
//  Created by 鈴木 公章 on 2020/05/05.
//

import Model
import UIKit

public class ListCollectionViewCell: UICollectionViewCell, NibLoadableView, ReusableView {
    @IBOutlet private var userImageView: UIImageView!
    @IBOutlet private var userNameLabel: UILabel!
    @IBOutlet private var createdAtLabel: UILabel!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private var likeButton: UIButton!
    @IBOutlet private var commentButton: UIButton!
    public var likeButtonTapped: (() -> Void)?
    public var commentButtonTapped: (() -> Void)?

    public func setup(_ post: Post) {
        contentView.isUserInteractionEnabled = false
        userImageView.loadImage(post.user.imageURL, processors: [.circle])
        userNameLabel.text = post.user.name
        createdAtLabel.text = post.createdAt
        textLabel.text = post.text
        likeButton.setTitle("\(post.likeCount) Likes", for: .normal)
        if post.isLike { likeButton.tintColor = .red }
        if !post.isLike { likeButton.tintColor = .darkText }
        guard let imageURL = post.imageURL else { return }
        imageView.loadImage(imageURL)
    }
}

extension ListCollectionViewCell {
    @IBAction private func likeButtonTapped(_ sender: UIButton) { likeButtonTapped?() }
    @IBAction private func commentButtonTapped(_ sender: UIButton) { commentButtonTapped?() }
}
