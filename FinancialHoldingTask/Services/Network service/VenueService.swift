//
//  VenueService.swift
//  FinancialHoldingTask
//
//  Created by Aya Mashaly on 19/09/2025.
//

import Foundation

class VenueService {
    private let api = APIService.shared
    private let baseUrl = Config.baseUrl
    
    func fetchVenues(lat: Double, lng: Double) async throws -> [Venue] {
        guard var urlComponents = URLComponents(string: baseUrl) else {
            throw URLError(.badURL)
        }
        
        let params = VenueQueryParams(
            lat: lat,
            lng: lng,
            clientId: Config.clientId,
            clientSecret: Config.clientSecret,
            version: Config.version
        )
        
        urlComponents.queryItems = params.queryItems
        
        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }
        
        let venueResponse: VenueResponse = try await api.fetchData(url: url)
        return venueResponse.response.venues
    }
}
