//
//  Webservice.swift
//  Fraakost
//
//  Created by Morten Bøgh on 12/02/2017.
//
//

import Foundation

final class Webservice {
    let session: URLSession
    let apiKey = "J9zjLXONDt7KupEoAXQPP4JRFglvg9qK2hY0tm6U"

    init(session: URLSession = .shared) {
        self.session = session
    }

    func load<A>(resource: Resource<A>, completion: @escaping (A?) -> ()) {
        var request = URLRequest(url: resource.url)
        request.addValue(apiKey, forHTTPHeaderField: "x-api-key")
        session.dataTask(with: request) { data, _, _ in
            let result = data.flatMap(resource.parse)
            completion(result)
        }.resume()
    }
}
