//
//  ContentView.swift
//  splitwise-clone
//
//  Created by XIANGYU KONG on 1/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AddItemView()
                .tabItem {
                    Label("Add", systemImage: "book")
                }
            
            LoginView()
                .tabItem {
                    Label("Login", systemImage: "flag")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
