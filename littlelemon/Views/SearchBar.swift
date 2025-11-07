//
//  SearchBar.swift
//  littlelemon
//
//  Created by Soumen Bhuin on 03/11/25.
//  Copyright © 2025 smbhuin. All rights reserved.
//

import SwiftUI

struct SearchBar : View {
    @Binding var searchText: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search Menu", text: $searchText)
            }
            .padding(8)
            .background(Color.littleLemonLight)
            .cornerRadius(8)
        }
        .padding()
        .background(Color.littleLemonPrimary1)
    }
}

