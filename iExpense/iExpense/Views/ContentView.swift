//
//  ContentView.swift
//  iExpense
//
//  Created by Mac on 11/03/2024.
//
import Observation
import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()

    var body: some View {
       NavigationStack {
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text("name \(item.name)")
                }
                .onDelete(perform: { indexSet in
                    deleteExpenses(items: indexSet)
                })
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add expense item", systemImage: "plus") {
                    expenses.items.append(.init(name: "Example", type: "Personal", amount: 10))
                }
            }
        }
    }
    
    
    func deleteExpenses(items: IndexSet) {
        expenses.items.remove(atOffsets: items)
    }
}

#Preview {
    ContentView()
}


