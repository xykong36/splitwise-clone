//
//  GoogleSignInAuthenticator.swift
//  splitwise-clone-v2
//
//  Created by XIANGYU KONG on 2/3/24.
//

import Foundation
import GoogleSignIn
import UIKit

/// An observable class for authenticating via Google.
final class GoogleSignInAuthenticator: ObservableObject {
  private var authViewModel: AuthenticationViewModel

  /// Creates an instance of this authenticator.
  /// - parameter authViewModel: The view model this authenticator will set logged in status on.
  init(authViewModel: AuthenticationViewModel) {
    self.authViewModel = authViewModel
  }
//
//  
//
//    /// Signs in the user based upon the selected account.
//    /// - note: Successful calls to this will set the `authViewModel`'s `state` property.
//    func signIn() {
//        // Finding the key window's root view controller in iOS 15.0 and later
//        guard let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
//              let rootViewController = windowScene.windows.first(where: { $0.isKeyWindow })?.rootViewController else {
//            print("There is no root view controller!")
//            return
//        }
//
//        // Updated sign-in method with GIDConfiguration
//        GIDSignIn.sharedInstance.signIn(with: GIDConfiguration(clientID: "YOUR_CLIENT_ID"), presenting: rootViewController) { [weak self] user, error in
//            if let error = error {
//                print("Error! \(error.localizedDescription)")
//                return
//            }
//
//            guard let self = self, let user = user else {
//                print("Error! Unable to retrieve the user.")
//                return
//            }
//
//            // Here, instead of directly using user.profile, you should adjust how you use the user object.
//            // For example, using user.userID, user.profile.name, user.profile.email, etc.
//            // Adjust the following line according to how your authViewModel expects to receive the user's information.
//            self.authViewModel.state = .signedIn(user)
//        }
//    }
//
//
//  /// Signs out the current user.
//  func signOut() {
//    GIDSignIn.sharedInstance.signOut()
//    authViewModel.state = .signedOut
//  }
//
//  /// Disconnects the previously granted scope and signs the user out.
//  func disconnect() {
//    GIDSignIn.sharedInstance.disconnect { error in
//      if let error = error {
//        print("Encountered error disconnecting scope: \(error).")
//      }
//      self.signOut()
//    }
//  }
}
