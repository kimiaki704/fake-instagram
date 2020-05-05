//
//  PlaceholderTextView.swift
//  Component
//
//  Created by 鈴木 公章 on 2020/05/06.
//

import UIKit

public class PlaceholderTextView: UITextView {
    private var placeholderLabel = UILabel(frame: CGRect(x: 6, y: 8, width: 0, height: 0))
    @IBInspectable var placeholder: String = "" {
        didSet {
            placeholderLabel.font = UIFont.preferredFont(forTextStyle: .title3)
            placeholderLabel.text = placeholder
            placeholderLabel.sizeToFit()
        }
    }

    public override func awakeFromNib() {
        super.awakeFromNib()
        configurePlaceholder()
        togglePlaceholder()
    }

    private func configurePlaceholder() {
        placeholderLabel.textColor = .gray
        addSubview(placeholderLabel)
    }

    public func togglePlaceholder() {
        placeholderLabel.isHidden = text.isEmpty ? false : true
    }
}
