//
//  CircleButton.swift
//  Component
//
//  Created by 鈴木 公章 on 2020/05/05.
//

import UIKit

public class CircleButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var buttonBackgroundColor: UIColor = .white

    public init(frame: CGRect,
                cornerRadius: CGFloat = 0,
                buttonBackgroundColor: UIColor = .white) {
        super.init(frame: frame)
        self.cornerRadius = cornerRadius
        self.buttonBackgroundColor = buttonBackgroundColor
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
        setBackgroundImage(buttonBackgroundColor.imageFill(size: bounds.size, cornerRadius: cornerRadius), for: .normal)
    }
}
