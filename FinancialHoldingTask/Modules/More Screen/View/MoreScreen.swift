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
                    print("Privacy Policy")
                }
            }
            
            Section {
                Button("About") {
                    print("About")
                }
                Button("Contact Us") {
                    print("Contact Us")
                }
            }
        } 
    }
}

#Preview {
    MoreScreen()
}
