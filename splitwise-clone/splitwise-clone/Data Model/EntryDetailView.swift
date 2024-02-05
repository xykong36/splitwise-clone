//
//  EntryDetailView.swift
//  splitwise-clone
//
//  Created by Steven Hu on 2/3/24.
//

import SwiftUI

struct EntryDetailView: View {
    var entry: Entry
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    
    private let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()

    var body: some View {
        VStack {
            Text("Title: \(entry.title)")
            Text("Amount: \(currencyFormatter.string(from: NSNumber(value: entry.amount)) ?? "")")
            Text("Date: \(dateFormatter.string(from: entry.date))")
            // Add additional details as needed
        }
        .navigationBarTitle("Expense Details", displayMode: .inline)
    }
}
