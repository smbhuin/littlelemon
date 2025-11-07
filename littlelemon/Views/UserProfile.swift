//
//  UserProfile.swift
//  littlelemon
//
//  Created by Soumen Bhuin on 29/10/25.
//  Copyright © 2025 smbhuin. All rights reserved.
//

import SwiftUI

struct UserProfile: View {
    @StateObject var profileData = ProfileData()
    @StateObject var validator = Validator()

    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var phone = ""
    
    // State variables for email notifications
    @State private var receiveOrderStatuses: Bool = true
    @State private var receivePasswordChanges: Bool = true
    @State private var receiveSpecialOffers: Bool = true
    @State private var receiveNewsletter: Bool = true
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Personal information")
                    .font(.littleLemonHeadline())
                    .fontWeight(.bold)
                    .padding(.top, 10)
                
                Text("Avatar")
                    .foregroundColor(.gray)
                    .font(.littleLemonBody())
                
                HStack(spacing: 15) {
                    Image("Profile")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .scaledToFit()
                    
                    Button("Change") {
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.littleLemonPrimary1)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    Button("Remove") {
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    )
                }
                
                VStack(alignment: .leading) {
                    Text("First Name")
                        .font(.littleLemonSubheadline())
                        .padding(.bottom, 2)
                    TextField("Enter First Name", text: $firstName)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom, 16)
                }
                .padding(.top, 16)
                
                VStack(alignment: .leading) {
                    Text("Last Name")
                        .font(.littleLemonSubheadline())
                        .padding(.bottom, 2)
                    TextField("Enter Last Name", text: $lastName)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom, 16)
                }
                
                VStack(alignment: .leading) {
                    Text("Email")
                        .font(.littleLemonSubheadline())
                        .padding(.bottom, 2)
                    TextField("Enter Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom, 16)
                }
                
                VStack(alignment: .leading) {
                    Text("Phone")
                        .font(.littleLemonSubheadline())
                        .padding(.bottom, 2)
                    TextField("Enter Phone", text: $phone)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom, 16)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Email notifications")
                        .font(.littleLemonSubheadline())
                        .padding(.top, 10)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        NotificationToggle(label: "Order statuses", isChecked: $receiveOrderStatuses)
                        NotificationToggle(label: "Password changes", isChecked: $receivePasswordChanges)
                        NotificationToggle(label: "Special offers", isChecked: $receiveSpecialOffers)
                        NotificationToggle(label: "Newsletter", isChecked: $receiveNewsletter)
                    }
                    // Add an overlay to create the lemon leaf background image effect
                    .overlay(
                        Image(systemName: "leaf.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            .foregroundColor(Color(red: 0.94, green: 0.81, blue: 0.35).opacity(0.2))
                            .offset(x: 100, y: 50)
                    )
                }
                
                if validator.errorMessageShow {
                    withAnimation() {
                        Text(validator.errorMessage)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                    }
                }
                
                VStack(spacing: 15) {
                    Button("Log out") {
                        profileData.loggedIn = false
                        self.presentation.wrappedValue.dismiss()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.littleLemonPrimary2)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .fontWeight(.semibold)
                    
                    HStack(spacing: 15) {
                        Button("Discard changes") {
                            self.presentation.wrappedValue.dismiss()
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(Color.black)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.littleLemonPrimary1, lineWidth: 1)
                        )
                        
                        Button("Save changes") {
                            if validator.validateUserInput(firstName: firstName, lastName: lastName, email: email, phoneNumber: phone) {
                                profileData.firstName = firstName
                                profileData.lastName = lastName
                                profileData.email = email
                                profileData.phone = phone
                                profileData.receiveOrderStatuses = receiveOrderStatuses
                                profileData.receivePasswordChanges = receivePasswordChanges
                                profileData.receiveSpecialOffers = receiveSpecialOffers
                                profileData.receiveNewsletter = receiveNewsletter
                                self.presentation.wrappedValue.dismiss()
                            }
                            
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.littleLemonPrimary1)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .fontWeight(.semibold)
                    }
                }
                .padding(.vertical, 20)
            }
            .padding()
        }
        .littleLemonNavigationBarStyle()
        .onAppear {
            firstName = profileData.firstName
            lastName = profileData.lastName
            email = profileData.email
            phone = profileData.phone
            receiveOrderStatuses = profileData.receiveOrderStatuses
            receivePasswordChanges = profileData.receivePasswordChanges
            receiveSpecialOffers = profileData.receiveSpecialOffers
            receiveNewsletter = profileData.receiveNewsletter
        }
    }
}

struct NotificationToggle: View {
    let label: String
    @Binding var isChecked: Bool
    var body: some View {
        HStack {
            // Custom Checkbox
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .foregroundColor(Color.littleLemonPrimary1)
                .font(.title3)
                .onTapGesture {
                    isChecked.toggle()
                }
            Text(label)
            Spacer()
        }
    }
}

#Preview {
    UserProfile()
}
