//
//  TitleLabel.swift
//  ViewsAndModifiers
//
//  Created by Mac on 09/03/2024.
//

import SwiftUI

struct TitleLabel : View {
    var title: String
    var body: some View {
        Text(title)
            .titleStyle()
    }
}



#Preview {
    TitleLabel(title: "Some title")
}
