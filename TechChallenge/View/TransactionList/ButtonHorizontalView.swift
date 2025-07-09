//
//  ButtonHorizontalView.swift
//  TechChallenge
//
//  Created by Arpit Mallick on 7/9/25.
//

import SwiftUI

struct ButtonHorizontalView: View {
    @Binding var selectedFilter: TransactionListView.TransactionFilter

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(TransactionListView.TransactionFilter.allCases, id: \.self) { filter in
                    Button(action: {
                        selectedFilter = filter
                    }) {
                        Text(filter.rawValue)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(filter == .all ? Color.black : (filter.category?.color ?? .gray))
                                    .opacity(0.8)
                            )
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top)
        }
    }
}
