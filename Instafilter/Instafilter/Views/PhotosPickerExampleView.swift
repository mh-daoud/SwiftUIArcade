//
//  PhotosPickerExampleView.swift
//  Instafilter
//
//  Created by Mac on 22/03/2024.
//
import PhotosUI
import SwiftUI

struct PhotosPickerExampleView: View {
    @State private var pickerItem: PhotosPickerItem?
    @State private var pickerItems = [PhotosPickerItem]()
    @State private var selectedImage: Image?
    @State private var selectedImages = [Image]()

    var body: some View {
        VStack {
            PhotosPicker("Select a picture", selection: $pickerItem, matching: .images)
            
            PhotosPicker(selection: $pickerItems, maxSelectionCount: 3, matching: .images) {
                Label("Select a picture", systemImage: "photo")
            }
            
            selectedImage?
                .resizable()
                .scaledToFit()
            
            ScrollView {
                ForEach(0..<selectedImages.count, id: \.self) { i in
                    selectedImages[i]
                        .resizable()
                        .scaledToFit()
                }
            }
            
        }.onChange(of: pickerItem) {
            Task {
                selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
            }
        }
        .onChange(of: pickerItems) {
            Task {
                selectedImages.removeAll()

                for item in pickerItems {
                    if let loadedImage = try await item.loadTransferable(type: Image.self) {
                        selectedImages.append(loadedImage)
                    }
                }
            }
        }
    }
}

#Preview {
    PhotosPickerExampleView()
}
