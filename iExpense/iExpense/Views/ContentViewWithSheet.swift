//
//  ContentViewWithSheet.swift
//  iExpense
//
//  Created by Mac on 11/03/2024.
//

import SwiftUI




struct ContentViewWithSheet: View {
    @State private var showingSheet = false

    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }.sheet(isPresented: $showingSheet) {
            SecondView(name: "Nopa")
        }
    }
}



#Preview {
    ContentViewWithSheet()
}
