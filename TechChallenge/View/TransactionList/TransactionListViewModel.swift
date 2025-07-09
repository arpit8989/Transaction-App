//
//  TransactionListViewModel.swift
//  TechChallenge
//
//  Created by Arpit Mallick on 7/9/25.
//

import Foundation

class TransactionListViewModel: ObservableObject {
    @Published var selectedFilter: TransactionListView.TransactionFilter = .all
    let transactions: [TransactionModel] = ModelData.sampleTransactions

    var filteredTransactions: [TransactionModel] {
        guard let selectedCategory = selectedFilter.category else {
            return transactions
        }
        return transactions.filter { $0.category == selectedCategory }
    }

    var totalAmount: Double {
        filteredTransactions.reduce(0) { $0 + $1.amount }
    }
}
