//
//  ObservableCodable.swift
//  CupcakeCorner
//
//  Created by Mac on 15/03/2024.
//

import SwiftUI

struct ObservableCodable: View {
    var body: some View {
         Button("Encode Taylor", action: encodeTaylor)
     }

     func encodeTaylor() {
         let data = try! JSONEncoder().encode(User())
         let str = String(decoding: data, as: UTF8.self)
         print(str)
     }
}

#Preview {
    ObservableCodable()
}
