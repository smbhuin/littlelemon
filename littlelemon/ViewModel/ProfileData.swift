//
//  Profile.swift
//  littlelemon
//
//  Created by Soumen Bhuin on 06/11/25.
//  Copyright © 2025 smbhuin. All rights reserved.
//

import SwiftUI
import Combine

class ProfileData : ObservableObject {
    @AppStorage("loggedIn") var loggedIn: Bool = false
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String =  ""
    @AppStorage("email") var email: String =  ""
    @AppStorage("phone") var phone: String = ""
    @AppStorage("receiveOrderStatuses") var receiveOrderStatuses: Bool = true
    @AppStorage("receivePasswordChanges") var receivePasswordChanges: Bool = true
    @AppStorage("receiveSpecialOffers") var receiveSpecialOffers: Bool = true
    @AppStorage("receiveNewsletter") var receiveNewsletter: Bool = true
}
