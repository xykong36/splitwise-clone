import SwiftUI
import GoogleSignIn

/// A class conforming to `ObservableObject` used to represent a user's authentication status.
final class AuthenticationViewModel: ObservableObject {
    @Published var state: State
    private lazy var authenticator: GoogleSignInAuthenticator = {
      GoogleSignInAuthenticator(authViewModel: self)
    }()

    var authorizedScopes: [String] {
        switch state {
        case .signedIn(let user):
            return user.grantedScopes ?? []
        case .signedOut:
            return []
        }
    }

    init() {
      // Initialize `state` before referencing `self` for `authenticator`.
      if let user = GIDSignIn.sharedInstance.currentUser {
        self.state = .signedIn(user)
      } else {
        self.state = .signedOut
      }
    }

  /// Signs the user in.
  func signIn() {
    authenticator.signIn()
  }

  /// Signs the user out.
  func signOut() {
    authenticator.signOut()
  }

  /// Disconnects the previously granted scope and logs the user out.
  func disconnect() {
    authenticator.disconnect()
  }

}

extension AuthenticationViewModel {
  /// An enumeration representing logged in status.
  enum State {
    /// The user is logged in and is the associated value of this case.
    case signedIn(GIDGoogleUser)
    /// The user is logged out.
    case signedOut
  }
}
