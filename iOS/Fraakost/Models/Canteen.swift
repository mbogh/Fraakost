//
//  Canteen.swift
//  Fraakost
//
//  Created by Morten Bøgh on 19/10/2016.
//
//

import RealmSwift

class Canteen: Object {
    dynamic var id: String = ""
    dynamic var name: String = ""
    dynamic var address: String = ""

    override static func primaryKey() -> String? {
        return "id"
    }
}

extension Canteen {
    convenience init?(dictionary: JSONDictionary) {
        guard let id = dictionary["id"] as? String,
            let name = dictionary["name"] as? String,
            let address = dictionary["address"] as? String else { return nil }

        self.init()
        
        self.id = id
        self.name = name
        self.address = address
    }
}
