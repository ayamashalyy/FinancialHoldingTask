//
//  VenueCardView.swift
//  FinancialHoldingTask
//
//  Created by Aya Mashaly on 18/09/2025.
//

import SwiftUI

struct VenueCardView: View {
    let model: Venue
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(model.name ?? "")
                .font(.headline)
            
            if let formattedAddress = model.location?.formattedAddress {
                Text(formattedAddress.joined(separator: ", "))
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            if let firstCategory = model.categories?.first {
                HStack(spacing: 8) {
                    if let icon = firstCategory.icon {
                        let iconUrl = "\(icon.prefix ?? "")bg_32\(icon.suffix ?? "")"
                        AsyncImage(url: URL(string: iconUrl)) { image in
                            image
                                .resizable()
                                .frame(width: 32, height: 32)
                                .cornerRadius(4)
                        } placeholder: {
                            Color.gray.frame(width: 32, height: 32)
                        }
                    }
                    
                    Text(firstCategory.name ?? "")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.vertical, 4)
    }
}
