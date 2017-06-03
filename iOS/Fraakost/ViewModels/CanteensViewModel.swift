//
//  CanteensViewModel.swift
//  Fraakost
//
//  Created by Morten Bøgh on 01/06/2017.
//
//

import Foundation
import RealmSwift

final class CanteensViewModel {
    private let realm: Realm
    private var canteens: Results<Canteen>
    let numberOfSections = 1

    init(realm: Realm) {
        self.realm = realm
        self.canteens = realm.objects(Canteen.self)
    }

    func numberOfRows(inSection section: Int) -> Int {
        return canteens.count
    }

    func canteen(forRowAt indexPath: IndexPath) -> Canteen {
        return canteens[indexPath.row]
    }
}
