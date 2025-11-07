//
//  Onboarding.swift
//  littlelemon
//
//  Created by Soumen Bhuin on 29/10/25.
//  Copyright © 2025 smbhuin. All rights reserved.
//

import SwiftUI


struct Onboarding: View {
    @EnvironmentObject var stackNavigator: StackNavigator
    @StateObject var profileData = ProfileData()
    @StateObject var validator = Validator()
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    
    var body: some View {
        VStack {
            Image("LittleLemon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 200)
            Text("Welcome to Little Lemon").font(.littleLemonTitle())
                .padding(.vertical, 32)
            VStack(alignment: .leading) {
                Text("First Name")
                    .font(.littleLemonSubheadline())
                    .padding(.bottom, 2)
                TextField("Enter First Name", text: $firstName)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom, 16)
            }
            .padding(.horizontal, 16)
            VStack(alignment: .leading) {
                Text("Last Name")
                    .font(.littleLemonSubheadline())
                    .padding(.bottom, 2)
                TextField("Enter Last Name", text: $lastName)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom, 16)
            }
            .padding(.horizontal, 16)
            VStack(alignment: .leading) {
                Text("Email")
                    .font(.littleLemonSubheadline())
                    .padding(.bottom, 2)
                TextField("Enter Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom, 16)
            }
            .padding(.horizontal, 16)
            if validator.errorMessageShow {
                withAnimation() {
                    Text(validator.errorMessage)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                }
            }
            Button(action: {
                if validator.validateUserInput(firstName: firstName, lastName: lastName, email: email) {
                    profileData.firstName = firstName
                    profileData.lastName = lastName
                    profileData.email = email
                    profileData.loggedIn = true
                    stackNavigator.push("menu")
                }
            }) {
                Text("Register").frame(maxWidth: .infinity, maxHeight: 32)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color.littleLemonPrimary1)
            .padding()
        }
        
    }
}

#Preview {
    Onboarding()
}
