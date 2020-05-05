//
//  RightBarButtonView.swift
//  Component
//
//  Created by 鈴木 公章 on 2020/05/06.
//

import UIKit

public class RightBarButtonView: UIView, NibLoadableView {
    @IBOutlet private var actionButton: UIButton!
    public var actionButtonTapped: (() -> Void)?

    public override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
    }

    private func setup() {
        backgroundColor = UIColor(hex: "00FF7A")
        layer.masksToBounds = true
    }

    public func setTitle(_ title: String) {
        actionButton.setTitle(title, for: .normal)
    }

    @IBAction private func actionButtonTapped(_ sender: UIButton) { actionButtonTapped?() }
}
