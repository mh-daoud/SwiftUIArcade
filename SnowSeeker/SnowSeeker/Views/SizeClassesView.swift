//
//  SizeClassesView.swift
//  SnowSeeker
//
//  Created by Mac on 23/03/2024.
//

import SwiftUI

struct SizeClassesView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(\.verticalSizeClass) var vSizeClass

        var body: some View {
            if sizeClass == .compact {
                VStack(content: UserView.init)
            } else {
                HStack(content: UserView.init)
            }
        }
}

#Preview {
    SizeClassesView()
}
