//
//  AppCoordinatorProtocol.swift
//  FinancialHoldingTask
//
//  Created by Aya Mashaly on 18/09/2025.
//

import Foundation
import SwiftUI

protocol AppCoordinatorProtocol: ObservableObject {
    var path: NavigationPath { get set }
    func push(_ screen:  Screen)
    func pop()
    func popToRoot()
}

enum Screen: Hashable {
    case home, profile, more, termsAndConditions, privacyPolicy, about, contactUs
    
    var id: Self { self }
    
    var tabTitle: String {
        switch self {
        case .home: return "Home"
        case .profile: return "Profile"
        case .more: return "More"
        default: return ""
        }
    }
    
    var tabImage: String {
        switch self {
        case .home: return "house"
        case .profile: return "person"
        case .more: return "ellipsis"
        default: return ""
        }
    }
}

