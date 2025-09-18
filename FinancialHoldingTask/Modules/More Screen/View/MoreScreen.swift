//
//  MoreScreen.swift
//  FinancialHoldingTask
//
//  Created by Aya Mashaly on 18/09/2025.
//

import SwiftUI

struct MoreScreen: View {
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        List {
            Section {
                Button("Terms & Conditions") {
                    coordinator.push(.termsAndConditions)
                }
                Button("Privacy Policy") {
                    coordinator.push(.privacyPolicy)
                }
            }
            
            Section {
                Button("About") {
                    coordinator.push(.about)
                }
                Button("Contact Us") {
                    coordinator.push(.contactUs)
                }
            }
        }
    }
}

#Preview {
    MoreScreen()
}
