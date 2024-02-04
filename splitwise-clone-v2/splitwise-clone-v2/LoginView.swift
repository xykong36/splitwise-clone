//
//  LoginView.swift
//  splitwise-clone-v2
//
//  Created by XIANGYU KONG on 2/3/24.
//

import SwiftUI
import GoogleSignInSwift

struct LoginView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @ObservedObject var vm = GoogleSignInButtonViewModel()
    
    var body: some View {
        VStack{
            GoogleSignInButton(viewModel: vm, action: authViewModel.signIn)
              .accessibilityIdentifier("GoogleSignInButton")
              .accessibility(hint: Text("Sign in with Google button."))
              .padding()
        }
        
    }
}

#Preview {
    LoginView()
}
