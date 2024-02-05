//
//  PurchaseData.swift
//  splitwise-clone
//
//  Created by Steven Hu on 2/3/24.
//

import SwiftUI

class PurchaseData: ObservableObject {
    @Published var entries: [Entry] = [
        Entry(
            title: "Midwood BBQ",
            amount: 10,
            members:
            [
                Member(count: 2, names: ["Xiangyu", "Steven"]),
            ]
        ),
    ]
}
