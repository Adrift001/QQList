//
//  AppDelegate.swift
//  QQList
//
//  Created by Adrift on 16/8/8.
//  Copyright © 2016年 adrift. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = UINavigationController(rootViewController: ListViewController(style: UITableView.Style.grouped))
        window?.makeKeyAndVisible()
        return true
    }
}

