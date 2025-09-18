//
//  VenuesListView.swift
//  FinancialHoldingTask
//
//  Created by Aya Mashaly on 18/09/2025.
//

import SwiftUI

struct VenuesListView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
                    .scaleEffect(1.5)
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
            } else if viewModel.venues.isEmpty {
                Text("No available places")
                    .foregroundColor(.gray)
            } else {
                List(viewModel.venues, id: \.id) { venue in
                    VenueCardView(model: venue)
                }
            }
        }
    }
}

#Preview {
    VenuesListView(viewModel: HomeViewModel())
}
