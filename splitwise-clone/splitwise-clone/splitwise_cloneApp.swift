//
//  splitwise_cloneApp.swift
//  splitwise-clone
//
//  Created by XIANGYU KONG on 1/22/24.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct AboutMeApp: App {
    @StateObject var purchaseData = PurchaseData()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
  }
}
