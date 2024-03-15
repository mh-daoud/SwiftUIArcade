//
//  SwiftUIView.swift
//  Moonshot
//
//  Created by Mac on 15/03/2024.
//

import SwiftUI

struct SwiftUIView: View {
    
    let layout = [
        //can specifiy number of columns as well as width of each column
        //        GridItem(.fixed(80)),
        //        GridItem(.fixed(80)),
        //        GridItem(.fixed(80))
        //or speficy min column width and let swift ui decide number of columns that meet this constraint of min width
        GridItem(.adaptive(minimum: 80)),//
    ]
    
    var body: some View {
        //vertical grid
//        ScrollView {
//            LazyVGrid(columns: layout) {
//                ForEach(0..<1000) {
//                    Text("Item \($0)")
//                }
//            }
//        }
        //horizontal grid
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

#Preview {
    SwiftUIView()
}
