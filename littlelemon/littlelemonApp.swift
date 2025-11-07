//
//  littlelemonApp.swift
//  littlelemon
//
//  Created by Soumen Bhuin on 29/10/25.
//  Copyright © 2025 smbhuin. All rights reserved.
//

import SwiftUI
import CoreData

@main
struct littlelemonApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
