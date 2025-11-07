//
//  MenuItem.swift
//  littlelemon
//
//  Created by Soumen Bhuin on 30/10/25.
//  Copyright © 2025 smbhuin. All rights reserved.
//

import Foundation

struct MenuList: Decodable {
    let menu: [MenuItem]
}

struct MenuItem: Codable, Identifiable {
    var id: Int
    let title: String
    let price: String
    let description: String
    let image: String
    let category: String
}
