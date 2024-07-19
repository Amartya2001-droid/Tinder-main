//
//  ToolbarLogo.swift
//  HeartSync
//
//  Created by Stephan Dowless on 1/21/24.
//

import SwiftUI

struct ToolbarLogo: View {
    var body: some View {
        Image(.heartSyncLogo)
            .resizable()
            .scaledToFill()
            .frame(width: 88)
    }
}

#Preview {
    ToolbarLogo()
}
