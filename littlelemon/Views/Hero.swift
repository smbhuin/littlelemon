//
//  Hero.swift
//  littlelemon
//
//  Created by Soumen Bhuin on 03/11/25.
//  Copyright © 2025 smbhuin. All rights reserved.
//

import SwiftUI

struct Hero : View {
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Little Lemon")
                        .font(.littleLemonTitle())
                        .fontWeight(.bold)
                        .foregroundColor(.littleLemonPrimary2)
                    Text("Chicago")
                        .font(.littleLemonSubtitle())
                        .foregroundColor(.littleLemonLight)
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .lineLimit(4)
                        .minimumScaleFactor(0.5)
                        .foregroundColor(.littleLemonLight)
                        .font(.littleLemonBody())
                }
                Spacer()
                Image("Hero")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color.littleLemonPrimary1)
    }
}

#Preview {
    Hero()
}
