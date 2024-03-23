//
//  TabViewExampleView.swift
//  HotProspects
//
//  Created by Mac on 22/03/2024.
//

import Foundation
import SwiftUI


struct TabViewExampleView : View {
    
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Button("Show Tab 2") {
                selectedTab = "Two"
            }
            .tabItem {
                Label("Button", systemImage: "star")
            }
            .tag("One")
            
            Text("Tab 1")
                .tabItem {
                    Label("One", systemImage: "star")
                }
                .tag("Two")
            
            Text("Tab 2")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
                .tag("Three")
        }
    }
}






#Preview {
    TabViewExampleView()
}

