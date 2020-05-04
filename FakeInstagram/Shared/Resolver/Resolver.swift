//
//  Resolver.swift
//  FakeInstagram
//
//  Created by 鈴木 公章 on 2020/05/04.
//

class Resolver {
    static let shared: Resolver = Resolver()
    let container: ObjectContainer

    init() { container = ObjectContainer() }
}
