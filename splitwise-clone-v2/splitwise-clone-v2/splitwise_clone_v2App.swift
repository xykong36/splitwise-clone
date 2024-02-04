//
//  splitwise_clone_v2App.swift
//  splitwise-clone-v2
//
//  Created by XIANGYU KONG on 2/3/24.
//


import SwiftUI
import FirebaseCore
import FirebaseAuth
import GoogleSignIn


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                       didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
      }

      func application(_ app: UIApplication,
                       open url: URL,
                       options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
      }
}

@main
struct splitwise_clone_v2App: App {
  @StateObject var authViewModel = AuthenticationViewModel()
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
          .environmentObject(authViewModel)
      }
    }
  }
}
