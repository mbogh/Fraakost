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
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        let rootViewController = UINavigationController()
        rootViewController.setNavigationBarHidden(true, animated: false)
        window?.rootViewController = rootViewController

        appCoordinator = AppCoordinator(navigationController: rootViewController)
        appCoordinator?.start()

        window?.makeKeyAndVisible()

        return true
    }
}
