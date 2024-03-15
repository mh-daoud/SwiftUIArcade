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
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal expenses") {
                    ListExpenseItemView(items: expenses.items.filter{$0.type == "Personal"}, onDelete: deleteExpenses)
                }
                Section("Business expenses") {
                    ListExpenseItemView(items: expenses.items.filter{$0.type == "Business"}, onDelete: deleteExpenses)
                }
               
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add expense item", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense, content: {
                AddView(expenses: expenses)
            })
        }
    }
    
    
    func deleteExpenses(itemId: UUID) {
        expenses.items.removeAll { $0.id == itemId }
    }
}

#Preview {
    ContentView()
}


