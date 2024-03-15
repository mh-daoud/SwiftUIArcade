//
//  HierarchicalCodable.swift
//  Moonshot
//
//  Created by Mac on 15/03/2024.
//

import SwiftUI

struct HierarchicalCodable: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """
            let jsonData = Data(input.utf8)
            if let user = try? JSONDecoder().decode(User.self, from: jsonData) {
                print(user.address.street)
            }
        }
    }
}

#Preview {
    HierarchicalCodable()
}


struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}
