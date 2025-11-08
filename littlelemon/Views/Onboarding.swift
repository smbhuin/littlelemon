//
//  Onboarding.swift
//  littlelemon
//
//  Created by Soumen Bhuin on 29/10/25.
//  Copyright © 2025 smbhuin. All rights reserved.
//

import SwiftUI

struct Onboarding: View {
    @EnvironmentObject var appNavigator: AppNavigator
    @StateObject var validator = Validator()
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                /*Image("LittleLemon")
                 .resizable()
                 .aspectRatio(contentMode: .fit)
                 .frame(width: 100, height: 200)
                 Text("Welcome to Little Lemon").font(.littleLemonTitle())
                 .padding(.vertical, 32)*/
                Hero()
                Spacer(minLength: 32)
                VStack(alignment: .leading) {
                    Text("First Name")
                        .font(.littleLemonSubheadline())
                        .padding(.bottom, 2)
                    TextField("Enter First Name", text: $firstName)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom, 16)
                        .textContentType(.name)
                }
                .padding(.horizontal, 16)
                VStack(alignment: .leading) {
                    Text("Last Name")
                        .font(.littleLemonSubheadline())
                        .padding(.bottom, 2)
                    TextField("Enter Last Name", text: $lastName)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom, 16)
                        .textContentType(.familyName)
                }
                .padding(.horizontal, 16)
                VStack(alignment: .leading) {
                    Text("Email")
                        .font(.littleLemonSubheadline())
                        .padding(.bottom, 2)
                    TextField("Enter Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom, 16)
                        .textContentType(.emailAddress)
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
                        let profileData = ProfileData()
                        profileData.firstName = firstName
                        profileData.lastName = lastName
                        profileData.email = email
                        profileData.loggedIn = true
                        appNavigator.push("menu")
                    }
                }) {
                    Text("Register").frame(maxWidth: .infinity, minHeight: 34)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.littleLemonPrimary1)
                .padding()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    Onboarding()
}
