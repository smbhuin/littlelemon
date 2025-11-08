//
//  AppNavigator.swift
//  littlelemon
//
//  Created by Soumen Bhuin on 08/11/25.
//  Copyright © 2025 smbhuin. All rights reserved.
//

import SwiftUI
import Combine

class AppNavigator : ObservableObject {
    @Published var rootPath = NavigationPath()
    @Published var menuPath = NavigationPath()
    @Published var profilePath = NavigationPath()

    func push<V>(_ value: V) where V : Hashable {
        rootPath.append(value)
    }
    
    func goBack() {
        rootPath.removeLast()
    }
    
    func goToRoot() {
        rootPath = NavigationPath()
    }

}
