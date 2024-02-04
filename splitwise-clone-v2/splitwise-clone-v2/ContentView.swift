//
//  ContentView.swift
//  splitwise-clone-v2
//
//  Created by XIANGYU KONG on 2/3/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
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
