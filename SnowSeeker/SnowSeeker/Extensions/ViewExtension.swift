//
//  ViewExtension.swift
//  SnowSeeker
//
//  Created by Mac on 23/03/2024.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}
