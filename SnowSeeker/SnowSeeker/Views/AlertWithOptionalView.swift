//
//  AlertWithOptionalView.swift
//  SnowSeeker
//
//  Created by Mac on 23/03/2024.
//

import SwiftUI

struct AlertWithOptionalView: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingUser = false
    
    var body: some View {
        Text("Hello, World!")
            .onTapGesture {
                selectedUser = User()
                isShowingUser = true
            }
//            .sheet(item: $selectedUser) { user in
//                Text(user.id)
//            }
            .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
                Button(user.id) { }
            }
    }
}

#Preview {
    AlertWithOptionalView()
}
