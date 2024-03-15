//
//  Expense.swift
//  iExpense
//
//  Created by Mac on 11/03/2024.
//

import Foundation
@Observable
class Expenses  {
    var items = [ExpenseItem]() {
        didSet {
            if let encodedData = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encodedData, forKey: "Items")
            }
        }
    }
    
    init()  {
        
        if let savedData = UserDefaults.standard.data(forKey: "Items"), let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedData) {
            items = decodedItems
            return
        }
        items = []
    }
}
