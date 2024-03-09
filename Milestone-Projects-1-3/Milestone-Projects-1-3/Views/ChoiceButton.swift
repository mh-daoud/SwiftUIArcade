//
//  ChoiceButton.swift
//  Milestone-Projects-1-3
//
//  Created by Mac on 09/03/2024.
//

import SwiftUI


struct ChoiceButton : View {
    let title: String
    let clouser: () -> Void
    var body: some View {
        Button(title) {
            clouser()
        }
        .choiceBorder()
    }
}


#Preview {
    ChoiceButton(title: "Button") {
        print("Testing .....")
    }
}
