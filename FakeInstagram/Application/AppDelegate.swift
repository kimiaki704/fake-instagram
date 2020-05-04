//
//  AppDelegate.swift
//  FakeInstagram
//
//  Created by Suzuki Kimiaki on 2020/05/01.
//  Copyright © 2020 Suzuki Kimiaki. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {
    var window: UIWindow?
}

extension AppDelegate: UIApplicationDelegate {
    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        RootRouter().presentListViewController(in: window!)
        return true
    }
}
