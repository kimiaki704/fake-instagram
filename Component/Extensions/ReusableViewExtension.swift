//
//  ReusableViewExtension.swift
//  Component
//
//  Created by 鈴木 公章 on 2020/05/04.
//

extension ReusableView {
    public static var reuseIdentifier: String {
        "reuse-" + String(describing: self)
    }
}
