
import SwiftUI

struct TransactionListView: View {
    let transactions: [TransactionModel] = ModelData.sampleTransactions
    
    var body: some View {
        List {
            ForEach(transactions) { transaction in
                TransactionView(transaction: transaction)
            }
        }
        .animation(.easeIn)
        .listStyle(PlainListStyle())
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
