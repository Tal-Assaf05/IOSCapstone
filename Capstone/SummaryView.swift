import SwiftUI

struct SummaryView: View {
    @State private var shifts: [Shift] = []
    private let storage = ShiftStorage()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    NavigationLink(destination: ShiftListView()) {
                        summaryCard(icon: "calendar", title: "Total Shifts", value: "\(shifts.count)", showArrow: true)
                    }

                    summaryCard(icon: "clock", title: "Total Hours", value: String(format: "%.2f hrs", totalHours()))
                    summaryCard(icon: "dollarsign.circle", title: "Total Earned", value: String(format: "$%.2f", totalEarnings()))
                    summaryCard(icon: "xmark.circle", title: "Unpaid Amount", value: String(format: "$%.2f", unpaidEarnings()))
                    summaryCard(icon: "timer", title: "Avg Duration", value: String(format: "%.2f hrs", avgDuration()))
                }
                .padding()

            }
            .navigationTitle("Summary")
            .onAppear {
                shifts = storage.loadShifts()
            }
        }
    }

    func summaryCard(icon: String, title: String, value: String, showArrow: Bool = false) -> some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 32))
                .foregroundColor(.accentColor)
                .frame(width: 44, height: 44)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(value)
                    .font(.title2)
                    .fontWeight(.bold)
            }

            Spacer()

            if showArrow {
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
        )
    }


    func totalHours() -> Double {
        shifts.reduce(0) {
            $0 + $1.endTime.timeIntervalSince($1.startTime) / 3600
        }
    }

    func totalEarnings() -> Double {
        shifts.reduce(0) { $0 + $1.totalEarnings }
    }

    func unpaidEarnings() -> Double {
        shifts.filter { !$0.isPaid }.reduce(0) { $0 + $1.totalEarnings }
    }

    func avgDuration() -> Double {
        guard !shifts.isEmpty else { return 0 }
        return totalHours() / Double(shifts.count)
    }
}
