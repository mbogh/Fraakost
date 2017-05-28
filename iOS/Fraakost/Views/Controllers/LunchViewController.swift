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

        let canteen = Canteen()
        canteen.id = UUID().uuidString
        canteen.name = "Midtown"
        canteen.address = "Hans Jensenvej 9-11, 7190 Billund"
        print("name of canteen: \(canteen.name)")

        // Get the default Realm
        let realm = try! Realm()
        print(realm.configuration.fileURL)

        let canteens = realm.objects(Canteen.self)
        print(canteens.count)

        // Persist your data easily
        try! realm.write {
            realm.add(canteen)
        }
        
        // Queries are updated in realtime
        print(canteens.count)
    }
}
