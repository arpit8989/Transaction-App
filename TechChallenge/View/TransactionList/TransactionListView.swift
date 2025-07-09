import SwiftUI

struct TransactionListView: View {
    @StateObject private var viewModel = TransactionListViewModel()

    enum TransactionFilter: String, CaseIterable {
        case all = "All"
        case food = "Food"
        case health = "Health"
        case entertainment = "Entertainment"
        case shopping = "Shopping"
        case travel = "Travel"

        var category: TransactionModel.Category? {
            switch self {
            case .all: return nil
            case .food: return .food
            case .health: return .health
            case .entertainment: return .entertainment
            case .shopping: return .shopping
            case .travel: return .travel
            }
        }
    }

    var body: some View {
        VStack {
            ButtonHorizontalView(selectedFilter: $viewModel.selectedFilter)
            List {
                ForEach(viewModel.filteredTransactions) { transaction in
                    TransactionView(transaction: transaction)
                }
            }
            .animation(.easeIn)
            .listStyle(PlainListStyle())
            HStack {
                Text("Total spent:")
                    .secondary()
                Spacer()
                VStack(alignment: .trailing, spacing: 2) {
                    if viewModel.selectedFilter != .all {
                        Text(viewModel.selectedFilter.rawValue.lowercased())
                            .font(.headline)
                            .foregroundColor(viewModel.selectedFilter.category?.color ?? .primary)
                    }
                    Text("$\(viewModel.totalAmount, specifier: "%.2f")")
                        .fontWeight(.bold)
                        .secondary()
                }
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.accentColor, lineWidth: 2)
            )
            .padding(.horizontal)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Transactions")
    }
}

#if DEBUG
struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView()
    }
}
#endif
