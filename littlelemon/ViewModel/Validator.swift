//
//  Validator.swift
//  littlelemon
//
//  Created by Soumen Bhuin on 03/11/25.
//  Copyright © 2025 smbhuin. All rights reserved.
//

import Foundation
import Combine

class Validator : ObservableObject {
    @Published var errorMessageShow = false
    @Published var errorMessage = ""
    
    func validateUserInput(firstName: String, lastName: String, email: String, phoneNumber: String? = nil) -> Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            errorMessage = "All fields are required"
            errorMessageShow = true
            return false
        }
        
        guard email.contains("@") else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        
        let email = email.split(separator: "@")
        
        guard email.count == 2 else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        
        guard email[1].contains(".") else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        
        if let phoneNumber = phoneNumber {
            guard phoneNumber.first == "+" && phoneNumber.dropFirst().allSatisfy({$0.isNumber}) || phoneNumber.isEmpty else {
                errorMessage = "Invalid phone number format."
                errorMessageShow = true
                return false
            }
        }
        
        errorMessageShow = false
        errorMessage = ""
        return true
    }
}
