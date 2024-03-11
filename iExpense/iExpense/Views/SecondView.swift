//
//  SecondView.swift
//  iExpense
//
//  Created by Mac on 11/03/2024.
//

import SwiftUI

struct SecondView: View {
    let name: String
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Hello \(name)") {
            dismiss()
        }
    }
}
