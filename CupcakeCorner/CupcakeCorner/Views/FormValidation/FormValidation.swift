//
//  FormValidation.swift
//  CupcakeCorner
//
//  Created by Mac on 15/03/2024.
//

import SwiftUI

struct FormValidation: View {
    
    @State private var username = ""
    @State private var email = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account…")
                }
            }
            .disabled(disableForm)
        }
    }
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
}

#Preview {
    FormValidation()
}
