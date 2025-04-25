import SwiftUI

struct ShiftListView: View {
    @State private var shifts: [Shift] = []
    private let storage = ShiftStorage()

    var body: some View {
        NavigationView {
            Group {
                if shifts.isEmpty {
                    VStack {
                        Image(systemName: "tray")
                            .font(.system(size: 64))
                            .foregroundColor(.gray)
                            .padding(.bottom, 8)
                        Text("No shifts yet")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List {
                        ForEach(Array(shifts.enumerated()), id: \.element.id) { index, shift in
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(.systemBackground))
                                    .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 2)

                                VStack(alignment: .leading, spacing: 6) {
                                    HStack {
                                        Text(shift.customerName)
                                            .font(.headline)
                                        Spacer()
                                        Text(shift.isPaid ? "✅ Paid" : "❌ Unpaid")
                                            .font(.subheadline)
                                            .foregroundColor(shift.isPaid ? .green : .red)
                                    }
                                    Text("Date: \(formattedDate(shift.date))")
                                        .font(.subheadline)
                                    Text("Total: $\(String(format: "%.2f", shift.totalEarnings))")
                                        .font(.subheadline)
                                }
                                .padding()
                            }
                            .padding(.vertical, 6)
                            .listRowBackground(Color.clear)
                        }
                        .onDelete(perform: deleteShift)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Shifts")
            .toolbar {
                EditButton()
            }
            .onAppear(perform: loadShifts)
        }
    }

    func loadShifts() {
        shifts = storage.loadShifts()
    }

    func deleteShift(at offsets: IndexSet) {
        for index in offsets {
            storage.deleteShift(at: index)
        }
        loadShifts()
    }

    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
