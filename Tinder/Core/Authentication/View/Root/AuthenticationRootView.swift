//
//  AuthenticationRootView.swift
//  HeartSync
//
//  Created by Amartya Karmakar on 02/05/24
//

import SwiftUI

struct AuthenticationRootView: View {
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var authDataStore: AuthDataStore
    
    @State private var showAuthFlow = false
    
    var body: some View {
        NavigationStack {
            VStack {
                AuthenticationTopView()
                
                Spacer()
                
                AuthenticationBottomView()
            }
            .background(gradientBackground)
            .onChange(of: authManager.authType, { oldValue, newValue in
                showAuthFlow = newValue != nil
            })
            .fullScreenCover(isPresented: $showAuthFlow) {
                EmailView()
                    .environmentObject(authManager)
                    .environmentObject(authDataStore)
                    .onDisappear { authManager.authType = nil }
            }
        }
    }
}

private extension AuthenticationRootView {
    var gradientBackground: LinearGradient {
        LinearGradient(
            colors: [
                Color(.tertiaryPink),
                Color(.primaryPink),
                Color(.secondaryPink)
            ],
            startPoint: .topTrailing,
            endPoint: .bottomLeading
        )
    }
}

#Preview {
    AuthenticationRootView()
        .environmentObject(AuthManager(service: MockAuthService()))
}
