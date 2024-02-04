//
//  AddItemView.swift
//  splitwise-clone
//
//  Created by XIANGYU KONG on 2/3/24.
//

import SwiftUI

struct AddItemView: View {
    
    @ObservedObject var purchaseData: PurchaseData
    
    // DateFormatter for formatting the date
        private let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            return formatter
        }()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(purchaseData.entries.indices, id: \.self) { index in
                        let entry = purchaseData.entries[index]
                        NavigationLink(destination: EntryDetailView(entry: entry)) {
                            Text("\(entry.title) - \(dateFormatter.string(from: entry.date))")
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .navigationBarTitle("My Expense")

                Spacer()
                
                HStack {
                    Spacer()
                    NavigationLink(destination: NewEntryView(purchaseData: purchaseData)) {
                        Text("+")
                            .font(.system(size: 48, weight: .bold))
                            .foregroundColor(.blue)
                            .padding()
                    }
                }
                
            }
        }
    }
}


struct NewEntryView: View {
    
    @ObservedObject var purchaseData: PurchaseData
    @State private var newEntry = Entry(title: "", amount: 0, date: Date(), members: [])
    @State private var selectedDate = Date()
    
    // Number formatter for currency input
    private let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()

    var body: some View {
        Form {
            Section(header: Text("New Entry")) {
                TextField("Title", text: $newEntry.title)
                
                TextField("Amount", value: $newEntry.amount, formatter: currencyFormatter)
                    .keyboardType(.decimalPad)
                
                DatePicker("Date", selection: $selectedDate, in: ...Date(), displayedComponents: .date)
                    .datePickerStyle(.compact)
                
                // TextFields to input member names
                ForEach(newEntry.members.indices, id: \.self) { index in
                    TextField("Member \(index + 1)", text: Binding(
                        get: {
                            let member = newEntry.members[index]
                            return member.names.joined(separator: ", ")
                        },
                        set: {
                            let names = $0.components(separatedBy: ", ")
                            newEntry.members[index].names = names
                        }
                    ))
                }
                
                Button("Add Member") {
                    newEntry.members.append(Member(count: newEntry.members.count + 1, names: [""]))
                }
            }
            
            Button("Save") {
                newEntry.date = selectedDate
                // Remove members with empty names before saving
                newEntry.members = newEntry.members.filter { !$0.names.isEmpty }
                purchaseData.entries.append(newEntry)
                
                newEntry = Entry(title: "", amount: 0)
            }
        }
        .navigationBarTitle("New Entry", displayMode: .inline)
    }
}
