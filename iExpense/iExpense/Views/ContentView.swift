//
//  ContentView.swift
//  iExpense
//
//  Created by Mac on 11/03/2024.
//
import Observation
import SwiftUI

struct ContentView: View {
    @State private var user : User = .init()
    var body: some View {
        VStack {
            Text("first name \(user.firstName) and lastname \(user.lastName)")
            
            TextField("Enter first name", text: $user.firstName)
            TextField("Enter last name", text: $user.lastName)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


@Observable
class User {
    var firstName: String = ""
    var lastName: String = ""
}
