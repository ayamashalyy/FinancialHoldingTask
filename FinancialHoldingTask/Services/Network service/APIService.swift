//
//  APIService.swift
//  FinancialHoldingTask
//
//  Created by Aya Mashaly on 18/09/2025.
//

import Foundation

class APIService {
    
    static let shared = APIService()
    private init() {}
    
    private let clientId = AppStrings.clientId
    private let clientSecret = AppStrings.clientSecret
    private let version = AppStrings.version
    private let baseUrl = AppStrings.baseUrl
    
    // Generic fetch method
    func fetchData<T: Decodable>(url: URL) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        
        let decoded = try JSONDecoder().decode(T.self, from: data)
        return decoded
    }
    
    // Fetch venues using generic fetchData
    func fetchVenues(lat: Double, lng: Double) async throws -> [Venue] {
        guard var urlComponents = URLComponents(string: baseUrl) else {
            throw URLError(.badURL)
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "ll", value: "\(lat),\(lng)"),
            URLQueryItem(name: "client_id", value: clientId),
            URLQueryItem(name: "client_secret", value: clientSecret),
            URLQueryItem(name: "v", value: version)
        ]
        
        guard let url = urlComponents.url else { throw URLError(.badURL) }
        print("Fetching URL:", url.absoluteString)
        
        let venueResponse: VenueResponse = try await fetchData(url: url)
        
        return venueResponse.response.venues
    }

}
