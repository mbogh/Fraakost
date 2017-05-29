//
//  AppCoordinator.swift
//  Fraakost
//
//  Created by Morten Bøgh on 29/05/2017.
//
//

import UIKit
import RealmSwift

final class AppCoordinator {
    private let navigationController: UINavigationController
    private let realm = try! Realm()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        createdTestDataIfNeeded()

        let lunchViewController = LunchViewController()
        navigationController.pushViewController(lunchViewController, animated: false)
    }

    func createdTestDataIfNeeded() {
        let data: [[String: String]] = [
            [
                "id": "4DFB931D-0313-4A89-ADB1-2DC145E73052",
                "name": "Midtown",
                "address": "Hans Jensenvej 9-11, 7190 Billund"
            ],
            [
                "id": "7F003F9E-9316-498C-8FD5-D6EF2CDAC3D8",
                "name": "Rugmarken",
                "address": "Kornmarken 35, 7190 Billund"
            ],
            [
                "id": "150FA365-D8FF-4098-B4CB-E90BE62E99C4",
                "name": "Kornmarken",
                "address": "Kornmarken 33, 7190 Billund"
            ],
            [
                "id": "827F4014-C751-4D53-B500-1CEEB78BA0C6",
                "name": "Havremarken",
                "address": "Havremarken 1, 7190 Billund"
            ],
            [
                "id": "54C32E6E-A9D8-437A-B511-E5A0E4DF515D",
                "name": "MultiHuset",
                "address": "Kløvermarken 16, 7190 Billund"
            ],
            [
                "id": "265D218A-3AE8-42AF-AA9D-34ADCF552A69",
                "name": "Aastvej",
                "address": "Aastvej 1, 7190 Billund"
            ],
            [
                "id": "87ACD5FA-2E3F-45AD-AC64-827952E06558",
                "name": "Modulex",
                "address": "Kløvervej 110, 7190 Billund"
            ]
        ]

        let canteens: [Canteen] = data.flatMap(Canteen.init)

        try! realm.write {
            realm.add(canteens, update: true)
        }
    }
}
