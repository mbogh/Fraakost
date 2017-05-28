//
//  AppDelegate.swift
//  Fraakost
//
//  Created by Morten Bøgh on 03/09/2016.
//
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: LunchViewController())
        window?.makeKeyAndVisible()

        return true
    }
}
