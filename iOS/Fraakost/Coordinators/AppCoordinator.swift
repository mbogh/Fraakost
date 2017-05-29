//
//  AppCoordinator.swift
//  Fraakost
//
//  Created by Morten Bøgh on 29/05/2017.
//
//

import UIKit

final class AppCoordinator {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let lunchViewController = LunchViewController()
        navigationController.pushViewController(lunchViewController, animated: false)
    }
}
