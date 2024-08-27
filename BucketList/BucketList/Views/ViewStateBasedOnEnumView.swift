//
//  ViewStateBasedOnEnumView.swift
//  BucketList
//
//  Created by Mac on 22/03/2024.
//

import SwiftUI

struct ViewStateBasedOnEnumView: View {
    @State private var loadingState = LoadingState.loading
    
    var body: some View {
        NavigationStack {
            VStack {
                switch loadingState {
                case .loading:
                    LoadingView()
                case .success:
                    SuccessView()
                case .failed:
                    FailedView()
                }
            }.navigationTitle("View Status Based On Enums")
                .toolbar {
                    Menu("Menu", systemImage:"menu") {
                        Button("isLoading") { loadingState = .loading}
                        Button("Successeded") { loadingState = .success}
                        Button("Failed") { loadingState = .failed}
                    }
                    
                }
            
        }
        
        
    }
}

#Preview {
    ViewStateBasedOnEnumView()
}

enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}
