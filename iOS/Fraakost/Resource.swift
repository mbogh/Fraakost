//
//  Resource.swift
//  Fraakost
//
//  Created by Morten Bøgh on 12/02/2017.
//
//

import Foundation

typealias JSONDictionary = [String: AnyObject]

struct Resource<A> {
    let url: URL
    let parse: (Data) -> A?
}

extension Resource {
    init(url: URL, parseJSON: @escaping (Any) -> A?) {
        self.url = url
        self.parse = { data in
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            return json.flatMap(parseJSON)
        }
    }
}
