//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Mac on 11/03/2024.
//

import Foundation
struct ExpenseItem : Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
