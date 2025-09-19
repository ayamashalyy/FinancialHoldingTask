//
//  VenueQueryParams.swift
//  FinancialHoldingTask
//
//  Created by Aya Mashaly on 19/09/2025.
//

import Foundation

struct VenueQueryParams {
    let lat: Double
    let lng: Double
    let clientId: String
    let clientSecret: String
    let version: String
    
    var queryItems: [URLQueryItem] {
        return [
            URLQueryItem(name: VenueQueryKeys.ll, value: "\(lat),\(lng)"),
            URLQueryItem(name: VenueQueryKeys.clientId, value: clientId),
            URLQueryItem(name: VenueQueryKeys.clientSecret, value: clientSecret),
            URLQueryItem(name: VenueQueryKeys.version, value: version)
        ]
    }
}

