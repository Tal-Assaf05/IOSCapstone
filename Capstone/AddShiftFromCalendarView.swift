import SwiftUI

struct AddShiftFromCalendarView: View {
    var selectedDate: Date

    @Environment(\.presentationMode) var presentationMode

    @State private var startTime = Date()
    @State private var endTime = Date()
    @State private var customerName = ""
    @State private var hourlyRate = ""
    @State private var notes = ""
    @State private var isPaid = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Shift Details")) {
                    DatePicker("Start Time", selection: $startTime, displayedComponents: .hourAndMinute)
                    DatePicker("End Time", selection: $endTime, displayedComponents: .hourAndMinute)
                }

                Section(header: Text("Client Info")) {
                    TextField("Customer Name", text: $customerName)
                    TextField("Hourly Rate", text: $hourlyRate)
                        .keyboardType(.decimalPad)
                    TextField("Notes", text: $notes)
                }

                Section {
                    Toggle("Paid", isOn: $isPaid)
                }

                Button("Save Shift") {
                    saveShift()
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationTitle("New Shift")
        }
    }

    func saveShift() {
        guard let rate = Double(hourlyRate) else { return }

        let shift = Shift(
            date: selectedDate,
            startTime: startTime,
            endTime: endTime,
            customerName: customerName,
            hourlyRate: rate,
            notes: notes,
            isPaid: isPaid
        )

        let storage = ShiftStorage()
        storage.addShift(shift)
    }
}
