//
//  ContentView.swift
//  splitwise-clone
//
//  Created by XIANGYU KONG on 1/22/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var purchaseData = PurchaseData()

    var body: some View {
        TabView {
            LoginView()
                .tabItem {
                    Label("Login", systemImage: "flag")
                }
            AddItemView(purchaseData: purchaseData)
                .tabItem {
                    Label("Activity", systemImage: "book")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
