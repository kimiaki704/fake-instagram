//
//  ListCollectionViewCell.swift
//  Component
//
//  Created by 鈴木 公章 on 2020/05/05.
//

import UIKit

public class ListCollectionViewCell: UICollectionViewCell, NibLoadableView, ReusableView {
    @IBOutlet private var userImageView: UIImageView!
    @IBOutlet private var userNameLabel: UILabel!
    @IBOutlet private var createdAtLabel: UILabel!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private var likeButton: UIButton!
    @IBOutlet private var commentButton: UIButton!
}

extension ListCollectionViewCell {
    @IBAction private func likeButtonTapped(_ sender: UIButton) {}
    @IBAction private func commentButtonTapped(_ sender: UIButton) {}
}
