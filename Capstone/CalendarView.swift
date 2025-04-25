import SwiftUI

struct CalendarView: View {
    @State private var selectedDate = Date()
    @State private var showAddShift = false
    @State private var shiftsForDate: [Shift] = []
    
    private let storage = ShiftStorage()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                        .onChange(of: selectedDate) { _ in
                            loadShifts()
                        }
                        .padding(.horizontal)

                    Button(action: {
                        showAddShift = true
                    }) {
                        Text("Add Shift")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .padding(.horizontal)
                    }

                    if shiftsForDate.isEmpty {
                        Text("No shifts logged on this day.")
                            .foregroundColor(.gray)
                            .padding(.top)
                    } else {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(shiftsForDate, id: \.id) { shift in
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(shift.customerName)
                                        .font(.headline)
                                    Text("Start: \(formattedTime(shift.startTime)) - End: \(formattedTime(shift.endTime))")
                                    Text("Total: $\(String(format: "%.2f", shift.totalEarnings))")
                                    Text("Paid: \(shift.isPaid ? "✅" : "❌")")
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemBackground)).shadow(radius: 1))
                            }
                        }
                        .padding(.horizontal)
                    }

                    Spacer()
                }
                .padding(.top)
            }
            .navigationTitle("Home")
            .onAppear(perform: loadShifts)
            .sheet(isPresented: $showAddShift) {
                AddShiftFromCalendarView(selectedDate: selectedDate)
            }
        }
    }


    func loadShifts() {
        let allShifts = storage.loadShifts()
        shiftsForDate = allShifts.filter {
            Calendar.current.isDate($0.date, inSameDayAs: selectedDate)
        }
    }

    func formattedTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
