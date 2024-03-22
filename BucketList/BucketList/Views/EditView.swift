//
//  EditView.swift
//  BucketList
//
//  Created by Mac on 22/03/2024.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    
    var location: LocationWithDetails
    var onSave: (LocationWithDetails) -> Void
    
    @State private var viewModel : ViewModel
    
    
    init(location: LocationWithDetails, onSave: @escaping (LocationWithDetails) -> Void) {
        _viewModel = State(initialValue:  ViewModel(name: "", description: ""))
        self.location = location
       
        self.onSave = onSave
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Place name", text: $viewModel.name)
                    TextField("Description", text: $viewModel.description)
                }
                
                Section("Nearby…") {
                    switch viewModel.loadingState {
                    case .loaded:
                        ForEach(viewModel.pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ") +
                            Text(page.description)
                                .italic()
                        }
                    case .loading:
                        Text("Loading…")
                    case .failed:
                        Text("Please try again later.")
                    }
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("Save") {
                    var newLocation = location
                    newLocation.id = UUID()
                    newLocation.name = viewModel.name
                    newLocation.description = viewModel.description
                    
                    onSave(newLocation)
                    dismiss()
                }
            }
            .task {
                await viewModel.fetchNearbyPlaces(latitude: location.latitude, longitude: location.longitude)
            }
        }
    }
}

#Preview {
    EditView(location: LocationWithDetails.example) { _ in }
}
