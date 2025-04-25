import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Home")
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
