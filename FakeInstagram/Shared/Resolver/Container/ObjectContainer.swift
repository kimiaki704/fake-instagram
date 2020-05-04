//
//  ObjectContainer.swift
//  FakeInstagram
//
//  Created by 鈴木 公章 on 2020/05/04.
//

import Foundation

class ObjectContainer {
    private var container: [String: Any]
    private let queue = DispatchQueue(label: "neighba.container.lockQueue")

    init() { container = [:] }

    func singleton<T>(key: String? = nil, _ selector: () -> T) -> T {
        queue.sync {
            let key = key ?? String(describing: T.self)
            if let instance = container[key] as? T {
                debugPrint("Reuse singletion instance. KEY => \(key)")
                return instance
            }
            let newInstance = selector()
            debugPrint("Create new singleton instance. KEY => \(key)")
            container[key] = newInstance as Any
            return newInstance
        }
    }
}
