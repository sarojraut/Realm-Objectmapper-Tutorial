//
//  AppDelegate.swift
//  Test Project
//
//  Created by saroj raut on 11/13/19.
//  Copyright © 2019 saroj raut. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if window == nil {
           window = UIWindow()
        }
        return true
    }

    
}

