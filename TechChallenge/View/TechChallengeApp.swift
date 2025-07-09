
import SwiftUI

@main
struct TechChallengeApp: App {

    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    TransactionListView()
                }
                .tabItem {
                    Label("Transactions", systemImage: "list.bullet")
                }
                
                NavigationView {
                    InsightsView()
                }
                .tabItem {
                    Label("Insights", systemImage: "chart.pie.fill")
                }
            }
        }
    }
}
