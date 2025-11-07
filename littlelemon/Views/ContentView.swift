//
//  ContentView.swift
//  littlelemon
//
//  Created by Soumen Bhuin on 05/11/25.
//  Copyright © 2025 smbhuin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @StateObject var stackNavigator = StackNavigator()
    @StateObject var profileData = ProfileData()

    var body: some View {
        NavigationStack(path: $stackNavigator.path) {
            Group{
                if profileData.loggedIn {
                    Menu()
                }
                else {
                    Onboarding()
                }
            }
            .navigationDestination(for: String.self) { name in
                if name == "menu" {
                    Menu()
                }
                else if name == "profile" {
                    UserProfile()
                }
            }
        }
        .environmentObject(stackNavigator)
    }
}

#Preview {
    ContentView()
}
