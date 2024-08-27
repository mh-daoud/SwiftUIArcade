//
//  UserView.swift
//  SnowSeeker
//
//  Created by Mac on 23/03/2024.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna and Arya")
        }
        .font(.title)
    }
}

#Preview {
    UserView()
}
