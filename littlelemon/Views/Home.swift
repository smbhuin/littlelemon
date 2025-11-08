//
//  Home.swift
//  littlelemon
//
//  Created by Soumen Bhuin on 07/11/25.
//  Copyright © 2025 smbhuin. All rights reserved.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var appNavigator: AppNavigator

    var body: some View {
        TabView {
            NavigationStack(path: $appNavigator.menuPath) {
                Menu()
            }
            .tabItem {
                Label("Menu", systemImage: "list.dash")
            }
            .tag(0)
            
            NavigationStack(path: $appNavigator.profilePath) {
                UserProfile()
            }
            .tabItem {
                Label("Profile", systemImage: "square.and.pencil")
            }
            .tag(1)
        }
        
    }
}

#Preview {
    Home()
}
