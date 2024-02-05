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
                .navigationBarTitle("Add Item")

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
    @State private var newEntry = Entry(title: "", amount: 0)

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
            }

            Button("Save") {
                purchaseData.entries.append(newEntry)
            }
        }
        .navigationBarTitle("New Entry", displayMode: .inline)
    }
}
