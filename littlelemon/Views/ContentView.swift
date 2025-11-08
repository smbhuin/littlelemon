//
//  ContentView.swift
//  littlelemon
//
//  Created by Soumen Bhuin on 05/11/25.
//  Copyright © 2025 smbhuin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @StateObject var appNavigator = AppNavigator()

    var body: some View {
        NavigationStack(path: $appNavigator.rootPath) {
            Group{
                if ProfileData.isUserAlreadyLoggedIn() {
                    Menu()
                }
                else {
                    Onboarding()
                }
            }
            .navigationDestination(for: String.self) { name in
                if name == "home" {
                    Home()
                }
                else if name == "onboarding" {
                    Onboarding()
                }
                else if name == "menu" {
                    Menu()
                }
                else if name == "profile" {
                    UserProfile()
                }
            }
            .navigationDestination(for: Dish.self) { dish in
                ItemDetail(dish: dish)
            }
        }
        .environmentObject(appNavigator)
    }
}

#Preview {
    ContentView()
}
