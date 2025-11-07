//
//  MenuViewModel.swift
//  littlelemon
//
//  Created by Soumen Bhuin on 06/11/25.
//  Copyright © 2025 smbhuin. All rights reserved.
//

import SwiftUI
import Combine
import CoreData

@MainActor
class MenuViewModel: ObservableObject {
    @Published var isLoaded = false
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchMenu(viewContext: NSManagedObjectContext) async {
        guard let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json") else {
            errorMessage = "Invalid URL"
            return
        }
        isLoading = true
        defer { isLoading = false }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let fullMenu = try JSONDecoder().decode(MenuList.self, from: data)
            await createDishesFrom(menuItems: fullMenu.menu, viewContext)
            try viewContext.save()
            isLoaded = true
        } catch {
            errorMessage = "Failed to load: \(error.localizedDescription)"
        }
    }
    
    func exists(name: String,
                       _ context:NSManagedObjectContext) async -> Bool {
        let request = Dish.fetchRequest()
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", name)
        request.predicate = predicate
        do {
            let results = try context.fetch(request)
            return results.count > 0
        } catch (let error){
            print(error.localizedDescription)
            return false
        }
    }
    
    func createDishesFrom(menuItems:[MenuItem],
                                 _ context:NSManagedObjectContext) async {
        for menuItem in menuItems {
            if await exists(name: menuItem.title, context) {
                continue
            }
            let oneDish = Dish(context: context)
            oneDish.title = menuItem.title
            if let price = Float(menuItem.price) {
                oneDish.price = price
            }
            oneDish.desc = menuItem.description
            oneDish.image = menuItem.image
            oneDish.category = menuItem.category
        }
    }
}
