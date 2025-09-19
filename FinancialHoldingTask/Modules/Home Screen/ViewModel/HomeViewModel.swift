//
//  HomeViewModel.swift
//  FinancialHoldingTask
//
//  Created by Aya Mashaly on 18/09/2025.
//

import Foundation
import Combine

@MainActor
class HomeViewModel: ObservableObject {
    @Published var venues: [Venue] = []
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    private let venueService = VenueService()
    
    func fetchVenues(lat: Double, lng: Double) {
        isLoading = true
        Task {
            do {
                let results = try await venueService.fetchVenues(lat: lat, lng: lng)
                self.venues = results
            } catch {
                self.errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
}
