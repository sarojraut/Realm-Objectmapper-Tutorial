//
//  AppDelegate.swift
//  Test Project
//
//  Created by saroj raut on 11/13/19.
//  Copyright © 2019 saroj raut. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureRealmMigrations()
        
        UIView.transition(with: window!, duration: 0.3, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
            let oldState: Bool = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            let BooksListVCWithNav = UINavigationController(rootViewController: BooksListViewController())
            self.window?.rootViewController = BooksListVCWithNav
            self.window?.makeKeyAndVisible()
            UIView.setAnimationsEnabled(oldState)
        }, completion: { (finished: Bool) -> () in
           
        })
        return true
    }
    
}

private extension AppDelegate {
    
    func configureRealmMigrations() {
        let config = Realm.Configuration(
            schemaVersion: 4,
            migrationBlock: { migration, oldSchemaVersion in
                
                // We haven’t migrated anything yet, so oldSchemaVersion == 0
                if (oldSchemaVersion < 1) {
                    // Nothing to do!
                    // Realm will automatically detect new properties and removed properties
                    // And will update the schema on disk automatically
                }
        })
        Realm.Configuration.defaultConfiguration = config
        
    }
}
