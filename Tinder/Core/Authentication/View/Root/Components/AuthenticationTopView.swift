//
//  AuthenticationTopView.swift
//  HeartSync
//
//  Created by Amartya Karmakar on 02/05/24
//

import SwiftUI

struct AuthenticationTopView: View {
    var body: some View {
        VStack {
            Image(.heartSynclogowhite)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 40)
                .padding()
            
            VStack(spacing: 8) {
                HStack {
                    Text("It Starts")
                        .bold()
                    
                    Text("with")
                }
                HStack {
                    Text("a")
                    
                    Text("Swipe")
                        .bold()
                }
            }
            .font(.largeTitle)
            .foregroundStyle(.white)
            .frame(width: 210)
        }
    }
}

#Preview {
    AuthenticationTopView()
        .preferredColorScheme(.dark)
}
