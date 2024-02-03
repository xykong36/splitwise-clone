//
//  Entry.swift
//  splitwise-clone
//
//  Created by Steven Hu on 2/3/24.
//

import SwiftUI

struct Entry: Identifiable, Equatable {
    var id = UUID()
    var title: String
    var amount: Int
    var date: Date
    var members: [Member]
    
    init(title: String = "", amount: Int, date: Date = Date(), members: [Member] = []) {
        self.title = title
        self.amount = amount
        self.date = date
        self.members = members
    }
}

struct Member: Equatable, Codable {
    var count: Int
    var names: [String]
}
