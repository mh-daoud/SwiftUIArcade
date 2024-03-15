//
//  ListExpenseItemView.swift
//  iExpense
//
//  Created by Mac on 15/03/2024.
//

import SwiftUI


struct ListExpenseItemView : View {
    var items : [ExpenseItem]
    var onDelete: ((UUID) -> Void)?
    var body : some View {
        ForEach(items) { item in
            HStack {
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text(item.type)
                }
                
                Spacer()
                Text(item.amount, format: .currency(code: "USD"))
            }
        }
        .onDelete(perform: { indexSet in
            if let index = indexSet.first, let onDelete  {
                onDelete(items[index].id)
            }
        })
        
    }
}


#Preview {
    ListExpenseItemView(items: [])
}
