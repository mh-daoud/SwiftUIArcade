//
//  ContentView.swift
//  Challenge1
//
//  Created by Mac on 08/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = "minutes"
    let units = ["seconds", "minutes", "hours", "days"]
    @State private var outputUnit = "hours"
    
    @State private var input = 0
    
    var output : Double {
        var inputInSeconds = Double(input)
        switch inputUnit {
        case "minutes":
            inputInSeconds *= 60
        case "hours":
            inputInSeconds *= 60 * 60
        case "days":
            inputInSeconds *= 60 * 60 * 24
        case "seconds":
            fallthrough
        default:
            inputInSeconds *= 1
        }
        switch outputUnit {
        case "minutes":
            return inputInSeconds / 60
        case "hours":
            return inputInSeconds / (60*60)
        case "days":
            return inputInSeconds / (60*60*24)
        case "seconds" :
            fallthrough
        default :
            return inputInSeconds
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                
                Section("Select input unit for conversion") {
                    Picker("Please select a unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Please enter a value to convert") {
                    TextField("Please enter a value", value: $input, format: .number)
                        .keyboardType(.numberPad)
                }
                
                Section("Select output unit for conversion") {
                    Picker("Please select a unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Value converted from \(inputUnit) to \(outputUnit)") {
                    Text(output, format: .number)
                }
                
                
            }
            .navigationTitle("Unit Conversion")
        }
    }
}

#Preview {
    ContentView()
}
