//
//  EntryDetailView.swift
//  splitwise-clone
//
//  Created by Steven Hu on 2/3/24.
//

import SwiftUI

struct EntryDetailView: View {
    var entry: Entry

    var body: some View {
        VStack {
            Text("Title: \(entry.title)")
            Text("Amount: \(entry.amount)")
            // Add additional details as needed
        }
        .navigationBarTitle("Entry Details", displayMode: .inline)
    }
}
