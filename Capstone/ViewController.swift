import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ShiftListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Shifts")
                }

            AddShiftView()
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("Add")
                }

            SummaryView()
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Summary")
                }
        }
    }
}
