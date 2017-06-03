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
    private let webservice: Webservice

    init(navigationController: UINavigationController, webservice: Webservice = Webservice()) {
        self.navigationController = navigationController
        self.webservice = webservice
    }

    func start() {
        fetchCanteens()
        showLunch()
    }

    private func showLunch() {
        let lunchViewController = LunchViewController()
        lunchViewController.delegate = self
        navigationController.pushViewController(lunchViewController, animated: false)
    }

    fileprivate func showCanteens() {
        let viewModel = CanteensViewModel(realm: realm)
        let canteensViewController = CanteensViewController(viewModel: viewModel)
        canteensViewController.delegate = self
        navigationController.present(canteensViewController, animated: true, completion: nil)
    }

    private func fetchCanteens() {
        webservice.load(resource: Canteen.all) { canteens in
            guard let canteens = canteens else { return }
            guard let realm = try? Realm() else { return }
            try? realm.write {
                realm.add(canteens, update: true)
            }
        }
    }
}

// MARK: - LunchViewControllerDelegate
extension AppCoordinator: LunchViewControllerDelegate {
    func lunchViewControllerDidTapCanteens(_ lunchViewController: LunchViewController) {
        showCanteens()
    }
}

// MARK: - CanteensViewControllerDelegate
extension AppCoordinator: CanteensViewControllerDelegate {
    func canteensViewController(_ canteensViewController: CanteensViewController, didSelectCanteen canteen: Canteen) {
        canteensViewController.dismiss(animated: true, completion: nil)
    }
}
