//
//  PasswordView.swift
//  HeartSync
//
//  Created by Amartya Karmakar on 02/01/24
//

import SwiftUI

struct PasswordView: View {
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var authDataStore: AuthDataStore
    @EnvironmentObject var userManager: UserManager
    
    @State var isSecure = true
    @State var showAlert = false
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Your password?")
                    .bold()
                    .font(.title)
                
                Text("Don't lose access to your account, add your password.")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                
                VStack(spacing: 10) {
                    HStack {
                        if isSecure {
                            SecureField("Enter password", text: $authDataStore.password)
                        } else {
                            TextField("Enter password", text: $authDataStore.password)
                        }
                        
                        Image(systemName: isSecure ? "eye.slash" : "eye")
                            .onTapGesture { isSecure.toggle() }
                    }
                    
                    Divider()
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            Button {
                onNext()
            } label: {
                Text("Next")
                    .foregroundStyle(formIsValid ? .white : .black.opacity(0.5))
                    .bold()
                    .font(.title3)
                    .frame(width: 320, height: 50)
                    .background(formIsValid ? Color(.primaryPink) : Color(.systemGray5))
                    .clipShape(Capsule())
            }
            .disabled(!formIsValid)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    BackButton()
                }
            }
        }
        .onReceive(authManager.$authError, perform: { error in
            showAlert = error != nil
        })
        .alert("Error", isPresented: $showAlert, actions: {
            Button("Ok") {
                authManager.authError = nil 
            }
        }, message: {
            Text("Invalid login credentials. Please try again..")
        })
        .navigationBarBackButtonHidden()
        .padding()
    }
}

private extension PasswordView {
    func onNext() {
        Task {
            await authManager.authenticate(
                withEmail: authDataStore.email,
                password: authDataStore.password
            )
            
            await userManager.fetchCurrentUser()
        }
    }
}

extension PasswordView: FormValidatorProtocol {
    var formIsValid: Bool {
        return authDataStore.password.count >= 6
    }
}

#Preview {
    NavigationStack {
        PasswordView()
    }
}
