//
//  Menu.swift
//  littlelemon
//
//  Created by Soumen Bhuin on 29/10/25.
//  Copyright © 2025 smbhuin. All rights reserved.
//

import SwiftUI
import CoreData

struct CategoryButton: View {
    let title: String
    let isSelected: Bool
    
    var body: some View {
        Text(title)
            .font(.littleLemonBody())
            .fontWeight(.bold)
            .foregroundColor(isSelected ? Color.littleLemonLight : Color.littleLemonPrimary1)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(isSelected ? Color.littleLemonPrimary1 : Color.littleLemonLight)
            .cornerRadius(16)
    }
}


struct Menu: View {
    @Environment(\.managedObjectContext) private var dataContext
    @EnvironmentObject var appNavigator: AppNavigator
    @StateObject private var viewModel = MenuViewModel()

    @State private var searchText: String = ""
    @State private var selectedCategory: String = "All"
    let categories = ["All", "Mains", "Starters", "Desserts"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Hero()
                
            SearchBar(searchText: $searchText)
            
            Text("ORDER FOR DELIVERY!")
                .font(.littleLemonHeadline())
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categories, id: \.self) { category in
                        CategoryButton(title: category, isSelected: selectedCategory == category)
                            .onTapGesture {
                                selectedCategory = category
                            }
                    }
                }
                .padding(.horizontal, 16)
            }
            
            Divider()
                .padding(.vertical, 5)
            
            FetchedObjects(predicate: buildPredicate(),
                           sortDescriptors: buildSortDescriptors()) {
                (dishes: [Dish]) in
                if dishes.isEmpty && viewModel.isLoading {
                    VStack {
                        ProgressView("Loading menu...")
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                else if dishes.isEmpty {
                    VStack {
                        Text(viewModel.errorMessage ?? "Something went wrong!")
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                else {
                    List(dishes) { dish in
                        NavigationLink(value: dish) {
                            ItemRow(item: dish)
                        }
                    }
                    .listStyle(.plain)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .littleLemonNavigationBarStyle()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image("Logo")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
            }
            let tb = ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    appNavigator.push("profile")
                }) {
                    Image("Profile")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 32, height: 32)
                        .clipShape(.circle)
                }
                .buttonStyle(.plain)
            }
            if #available(iOS 26.0, *) {
                tb.sharedBackgroundVisibility(.hidden)
            } else {
                tb
            }
        }
        .task {
            if !(viewModel.isLoading || viewModel.isLoaded) {
                await viewModel.fetchMenu(viewContext: dataContext)
            }
        }
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title",
                                  ascending: true,
                                  selector:
                                    #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate() -> NSCompoundPredicate {
        let search = searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        let category = (selectedCategory == "All") || !searchText.isEmpty ? NSPredicate(value: true) : NSPredicate(format: "category = %@", selectedCategory.lowercased())
        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [search, category])
        return compoundPredicate
    }
    
        
}

#Preview {
    Menu()
}
