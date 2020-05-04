//
//  BorderButton.swift
//  Component
//
//  Created by 鈴木 公章 on 2020/05/05.
//

import UIKit

public class BorderButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var buttonBorderColor: UIColor = .white

    public init(frame: CGRect,
                cornerRadius: CGFloat = 0,
                buttonBorderColor: UIColor = .white) {
        super.init(frame: frame)
        self.cornerRadius = cornerRadius
        self.buttonBorderColor = buttonBorderColor
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    public override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    private func setup() {
        setBackgroundImage(buttonBorderColor.imageBorder(size: bounds.size, cornerRadius: cornerRadius), for: .normal)
    }
}
