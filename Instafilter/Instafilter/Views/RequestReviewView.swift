//
//  RequestReview.swift
//  Instafilter
//
//  Created by Mac on 22/03/2024.
//

import SwiftUI
import StoreKit

struct RequestReviewView: View {
    @Environment(\.requestReview) var requestReview

    var body: some View {
        Button("Leave a review") {
            requestReview()
        }
    }
}

#Preview {
    RequestReviewView()
}
