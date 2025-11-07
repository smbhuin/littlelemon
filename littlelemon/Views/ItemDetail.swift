//
//  ItemDetail.swift
//  littlelemon
//
//  Created by Soumen Bhuin on 03/11/25.
//  Copyright © 2025 smbhuin. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    let dish: Dish
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .clipShape(Rectangle())
            .frame(minHeight: 150)
            Text(dish.title ?? "")
                .font(.littleLemonSubtitle())
                .foregroundColor(.littleLemonPrimary1)
            Spacer(minLength: 20)
            Text(dish.desc ?? "")
                .font(.littleLemonBody())
            Spacer(minLength: 10)
            Text(dish.price.formatted(.currency(code: "USD")))
                .font(.littleLemonSubheadline())
                .foregroundColor(.littleLemonPrimary1)
                .monospaced()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .littleLemonNavigationBarStyle()
    }
}

struct DetailItem_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(dish: PersistenceController.oneDish())
    }
}
