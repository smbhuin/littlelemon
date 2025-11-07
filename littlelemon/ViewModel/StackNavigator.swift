//
//  StackNavigator.swift
//  littlelemon
//
//  Created by Soumen Bhuin on 05/11/25.
//  Copyright © 2025 smbhuin. All rights reserved.
//

import SwiftUI
import Combine

class StackNavigator : ObservableObject {
    @Published var path = NavigationPath()
    
    func push<V>(_ value: V) where V : Hashable {
        path.append(value)
    }
    
    func goBack() {
        path.removeLast()
    }
}
