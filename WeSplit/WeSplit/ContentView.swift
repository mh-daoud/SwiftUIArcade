//
//  ContentView.swift
//  WeSplit
//
//  Created by Mac on 08/03/2024.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var amountIsFocused : Bool
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10,15,20,25,0]
    
    var totalPerPerson : Double {
        let peopleCount = numberOfPeople + 2
        let orderTotalWithTip = checkAmount * (1.0 + (Double(tipPercentage)/100))
        return orderTotalWithTip / Double(peopleCount)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<98) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.menu)
                    TextField("Amount", value: $checkAmount,    format: .currency(code:     Locale.current.currency?    .identifier ??  "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                
                Section("How much tip do you want to leave?") {
                    
                    Picker("Select Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar(content: {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            })
            
        }
    }
    
}

#Preview {
    ContentView()
}
