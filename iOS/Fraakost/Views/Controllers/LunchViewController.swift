//
//  LunchViewController.swift
//  Fraakost
//
//  Created by Morten Bøgh on 17/09/2016.
//
//

import UIKit
import RealmSwift

class LunchViewController: UIViewController {
    var viewModel: LunchViewModel!
    let canteenView = CurrentCanteenView()
    let lunchView = LunchView()

    override func loadView() {
        self.view = setupView()
    }

    func setupView() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        canteenView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(canteenView)
        lunchView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lunchView)
        return view
    }

    func setupConstraints() {
        canteenView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        canteenView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        canteenView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true

        lunchView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        lunchView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true

        lunchView.topAnchor.constraint(equalTo: canteenView.bottomAnchor, constant: 16).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupConstraints()

        // Get the default Realm
        let realm = try! Realm()
        print(realm.configuration.fileURL)

        let canteens = realm.objects(Canteen.self)
        print(canteens.count)
    }
}
