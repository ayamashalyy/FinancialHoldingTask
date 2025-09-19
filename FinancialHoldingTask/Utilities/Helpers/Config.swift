//
//  Config.swift
//  FinancialHoldingTask
//
//  Created by Aya Mashaly on 19/09/2025.
//

import Foundation

struct Config {
    private static var config: [String: Any] {
        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path) as? [String: Any] else {
            fatalError("Config.plist not found")
        }
        return dict
    }

    static var clientId: String { config["CLIENT_ID"] as? String ?? "" }
    static var clientSecret: String { config["CLIENT_SECRET"] as? String ?? "" }
    static var version: String { config["API_VERSION"] as? String ?? "" }
    static var baseUrl: String { config["BASE_URL"] as? String ?? "" }
}
