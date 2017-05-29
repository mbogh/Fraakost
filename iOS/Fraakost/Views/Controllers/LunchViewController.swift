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
    let lunchView = LunchView()

    override func loadView() {
        self.view = setupView()
    }

    func setupView() -> UIView {
        let view = UIView()
        view.backgroundColor = .orange
        lunchView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lunchView)
        return view
    }

    func setupConstraints() {
        lunchView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        lunchView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true

        lunchView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
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
