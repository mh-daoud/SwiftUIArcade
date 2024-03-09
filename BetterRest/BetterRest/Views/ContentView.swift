//
//  ContentView.swift
//  BetterRest
//
//  Created by Mac on 09/03/2024.
//

import SwiftUI
import CoreML

struct ContentView: View {
    @State private var sleepAmount  = 8.0
    @State private var wakeUp = defaultWakeTime
    @State private var coffeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationStack {
            Form {
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("When do you want to wake up?")
                        .font(.headline)
                    DatePicker("Please enter a date",
                               selection: $wakeUp,
                               in: Date.now...,
                               displayedComponents: .hourAndMinute)
                    .labelsHidden()
                }
                
                VStack(alignment: .leading, spacing: 0){
                    Text("Desired amount of sleep")
                        .font(.headline)
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Daily coffee intake")
                        .font(.headline)
                    Stepper("\(coffeAmount) \(coffeAmount == 1 ? "cup" : "cup(s)")", value: $coffeAmount, in: 1...20)
                }
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculateBedtime)
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("Ok"){}
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            let prediction = try model.prediction(input: SleepCalculatorInput(wake: Int64(hour + minute), estimatedSleep: sleepAmount, coffee: Int64(coffeAmount)))
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
}

#Preview {
    ContentView()
}
