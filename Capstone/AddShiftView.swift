import SwiftUI

struct AddShiftView: View {
    @State private var date = Date()
    @State private var startTime = Date()
    @State private var endTime = Date()
    @State private var customerName = ""
    @State private var hourlyRate = ""
    @State private var notes = ""
    @State private var isPaid = false
    
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Shift Details")) {
                    DatePicker("Date", selection: $date, displayedComponents: .date)
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
                
                Button(action: saveShift) {
                    Text("Save Shift")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

            }
            .navigationTitle("Add Shift")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Saved!"), message: Text("Your shift has been added."), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func saveShift() {
        print("Save button tapped")

        guard let rate = Double(hourlyRate) else {
            print("Invalid hourly rate")
            return
        }
        
        let shift = Shift(
            date: date,
            startTime: startTime,
            endTime: endTime,
            customerName: customerName,
            hourlyRate: rate,
            notes: notes,
            isPaid: isPaid
        )
        
        let storage = ShiftStorage()
        storage.addShift(shift)
        
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)


        print("Shift saved:", shift)
        
        showAlert = true

        // Clear form
        customerName = ""
        hourlyRate = ""
        notes = ""
        isPaid = false
    }

}
