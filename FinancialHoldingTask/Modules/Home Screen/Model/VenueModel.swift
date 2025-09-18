//
//  VenueModel.swift
//  FinancialHoldingTask
//
//  Created by Aya Mashaly on 18/09/2025.
//

import Foundation

struct VenueResponse: Decodable {
    let response: Response
}

struct Response: Decodable {
    let venues: [Venue]
}

struct Venue: Decodable {
    let id: String?
    let name: String?
    let location: Location?
    let categories: [Category]?
}

struct Location: Decodable {
    let formattedAddress: [String]?
}

struct Category: Decodable {
    let name: String?
    let icon: Icon?
}

struct Icon: Decodable {
    let prefix: String?
    let suffix: String?
}

