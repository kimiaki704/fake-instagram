//
//  ViewProtocols.swift
//  Component
//
//  Created by 鈴木 公章 on 2020/05/04.
//

public protocol Instantiatable: class {
    static var storyboardName: String { get }
    static var bundle: Bundle? { get }
}

public protocol NibLoadableView: class {
    static var nibName: String { get }
    static var nibBundle: Bundle? { get }
}

public protocol ReusableView: class {
    static var reuseIdentifier: String { get }
}
