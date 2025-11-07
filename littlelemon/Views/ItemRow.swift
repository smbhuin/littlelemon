//
//  MenuItemRow.swift
//  littlelemon
//
//  Created by Soumen Bhuin on 03/11/25.
//  Copyright © 2025 smbhuin. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    let item: Dish
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title ?? "")
                    .font(.littleLemonHeadline())
                Text(item.desc ?? "")
                    .font(.littleLemonBody())
                    .foregroundColor(.gray)
                    .lineLimit(2)
                Text(item.price.formatted(.currency(code: "USD")))
                    .font(.littleLemonSubheadline())
                    .fontWeight(.bold)
                    .foregroundColor(.littleLemonPrimary1)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            AsyncImage(url: URL(string: item.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80)
            .cornerRadius(8)
            .clipped()
        }
        .padding(.vertical, 8)
    }
}
