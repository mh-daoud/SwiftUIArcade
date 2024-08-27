//
//  SearchView.swift
//  SnowSeeker
//
//  Created by Mac on 23/03/2024.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    let allNames = ["Subh", "Vina", "Melvin", "Stefanie"]
    
    var body: some View {
        NavigationStack {
            List(filteredNames, id: \.self) { name in
                Text(name)
            }
            .searchable(text: $searchText, prompt: "Look for something")
            .navigationTitle("Searching")
        }
    }
    
    var filteredNames: [String] {
          if searchText.isEmpty {
              return allNames
          } else {
              return allNames.filter { $0.contains(searchText) }
          }
      }
}

#Preview {
    SearchView()
}
