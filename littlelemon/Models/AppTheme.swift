//
//  AppTheme.swift
//  littlelemon
//
//  Created by Soumen Bhuin on 31/10/25.
//  Copyright © 2025 smbhuin. All rights reserved.
//

import SwiftUI

extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
    
    static let littleLemonPrimary1 = Color(hex: 0x495E57)
    static let littleLemonPrimary2 = Color(hex: 0xF4CE14)
    static let littleLemonSecondary1 = Color(hex: 0xEE9972)
    static let littleLemonSecondary2 = Color(hex: 0xFBDABB)
    static let littleLemonDark = Color(hex: 0x333333)
    static let littleLemonLight = Color(hex: 0xEDEFEE)

}

extension Font {
    static func littleLemonTitle() -> Font {
        return Font.custom("Markazi Text", size: 42).weight(.medium)
    }
    
    static func littleLemonSubtitle() -> Font {
        return Font.custom("Markazi Text", size: 32)
    }
    
    static func littleLemonHeadline() -> Font {
        return Font.custom("Karla", size: 18).bold()
    }
    
    static func littleLemonSubheadline() -> Font {
        return Font.custom("Karla", size: 16).bold()
    }
    
    static func littleLemonBody() -> Font {
        return Font.custom("Karla", size: 16)
    }
    
}


extension View {
    nonisolated public func littleLemonNavigationBarStyle() -> some View {
        self.navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(.white, for: .navigationBar)
        .toolbarColorScheme(.light, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image("Logo")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
            }
        }
    }

}

