//
//  TabBarView.swift
//  FinancialHoldingTask
//
//  Created by Aya Mashaly on 18/09/2025.
//


import SwiftUI

struct TabBarView: View {
    @StateObject var coordinator = AppCoordinator()
    @State var selectedTab: Screen = .home
    let tabs: [Screen] = [.home, .profile, .more]
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(tabs, id: \.self) { tab in
                NavigationStack(path: $coordinator.path) {
                    coordinator.build(tab)
                        .navigationDestination(for: Screen.self) { screen in
                            coordinator.build(screen)
                        }
                }
                
                .environmentObject(coordinator)
                .tabItem {
                    VStack {
                        Image(systemName: tab.tabImage)
                        Text(tab.tabTitle)
                    }
                }
            }
        }
        .tint(.black)
    }
}


#Preview {
    TabBarView()
}
