//
//  AddView.swift
//  iExpense
//
//  Created by Mac on 15/03/2024.
//

import SwiftUI


struct AddView : View {
    var expenses: Expenses
    private var types = ["Business", "Personal"]
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var amount = 0.0
    @State private var selectedType = "Personal"
    
    init(expenses: Expenses) {
        self.expenses = expenses
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $selectedType) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD")).keyboardType(.decimalPad)
                
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: selectedType, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}




#Preview {
    AddView(expenses: Expenses())
}
