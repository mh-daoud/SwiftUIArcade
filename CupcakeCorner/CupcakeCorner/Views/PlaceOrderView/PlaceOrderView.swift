//
//  PlaceOrderView.swift
//  CupcakeCorner
//
//  Created by Mac on 15/03/2024.
//

import SwiftUI

struct PlaceOrderView: View {
    @State private var order = Order()

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Please select type", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    Stepper("Amount \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $order.specialRequestEnabled)

                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)

                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink("Delivery details") {
                        AddressView(order: order)
                    }
                }
                
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

#Preview {
    PlaceOrderView()
}
