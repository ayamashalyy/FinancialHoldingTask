//
//  AppCoordinator.swift
//  FinancialHoldingTask
//
//  Created by Aya Mashaly on 18/09/2025.
//

import SwiftUI

class AppCoordinator: AppCoordinatorProtocol {
    @Published var path: NavigationPath = NavigationPath()
    
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(_ screen: Screen) -> some View {
        switch screen {
        case .home:
            HomeScreen()
        case .profile:
            ProfileScreen()
        case .more:
            MoreScreen()
        case .termsAndConditions:
            TermsAndConditionsScreen()
        case .privacyPolicy:
            PrivacyPolicyScreen()
        case .about:
            AboutScreen()
        case .contactUs:
            ContactUsScreen()
        }
    }
}
