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

    func signIn() {
        // Find the root view controller of the key window in iOS 15.0 and later
        guard let rootViewController = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .flatMap({ $0.windows })
            .first(where: { $0.isKeyWindow })?.rootViewController else {
                print("There is no root view controller!")
                return
        }

        // Sign-in method with GIDConfiguration
        GIDSignIn.sharedInstance.signIn(with: GIDConfiguration(clientID: "900121081088-395k8877s411222hictei3qi1dj5aupt.apps.googleusercontent.com"), presenting: rootViewController) { [weak self] user, error in
            if let error = error {
                print("Error! \(error.localizedDescription)")
                return
            }
            
            guard let self = self, let user = user else {
                print("Unable to retrieve the user.")
                return
            }
            
            // Set the authViewModel's state to signed in with the user's information
            self.authViewModel.state = .signedIn(user)
            
            // Success print statement
            print("Successfully signed in with Google!")
        }
    }
        

  /// Signs out the current user.
  func signOut() {
    GIDSignIn.sharedInstance.signOut()
    authViewModel.state = .signedOut
  }

  /// Disconnects the previously granted scope and signs the user out.
  func disconnect() {
    GIDSignIn.sharedInstance.disconnect { error in
      if let error = error {
        print("Encountered error disconnecting scope: \(error).")
      }
      self.signOut()
    }
  }
}
