//
//  splitwise_cloneApp.swift
//  splitwise-clone
//
//  Created by XIANGYU KONG on 1/22/24.
//

import SwiftUI

@main
struct AboutMeApp: App {
    @StateObject var purchaseData = PurchaseData()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
