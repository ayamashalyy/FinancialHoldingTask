//
//  HomeScreen.swift
//  FinancialHoldingTask
//
//  Created by Aya Mashaly on 18/09/2025.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject private var locationManager = LocationManager()
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VenuesListView(viewModel: viewModel)
            .onAppear {
                locationManager.startUpdating()
            }
            .onReceive(locationManager.$currentLocation.compactMap { $0 }) { location in
                viewModel.fetchVenues(lat: location.latitude, lng: location.longitude)
            }
    }
}


#Preview {
    HomeScreen()
}
