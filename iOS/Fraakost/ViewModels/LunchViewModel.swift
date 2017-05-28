//
//  LunchViewModel.swift
//  Fraakost
//
//  Created by Morten Bøgh on 17/09/2016.
//
//

import Foundation

struct LunchViewModel {
    private let lunch: Lunch
    let title: String

    init(lunch: Lunch) {
        self.lunch = lunch
        self.title = LunchViewModel.dateFormatter.string(from: lunch.date)
    }
}

extension LunchViewModel {
    static let dateFormatter = { () -> DateFormatter in
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter
    }()
}
