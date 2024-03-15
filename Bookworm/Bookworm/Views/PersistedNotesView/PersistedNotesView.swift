//
//  PersistedNotesView.swift
//  Bookworm
//
//  Created by Mac on 15/03/2024.
//

import SwiftUI

struct PersistedNotesView: View {
    @AppStorage("notes") private var notes = ""
    var body: some View {
        NavigationStack {
            Form {
                Section("TextEditor") {
                    TextEditor(text: $notes)
                        .navigationTitle("Notes")
                        .frame(minHeight: 200)
                }
                Section("TextField") {
                    TextField("Notes", text: $notes, axis: .vertical)
                }
            }
            
        }
    }
}

#Preview {
    PersistedNotesView()
}
