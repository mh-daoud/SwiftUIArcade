//
//  TitleLabel.swift
//  Milestone-Projects-1-3
//
//  Created by Mac on 09/03/2024.
//

import SwiftUI

struct TitleLabel : View {
    let text : String
    var body: some View {
        Text(text)
            .font(.largeTitle.bold())
            .foregroundStyle(.primary)
    }
}





#Preview {
    TitleLabel(text: "Some Title")
}
