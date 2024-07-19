//
//  SexualOrientationSelectionView.swift
//  HeartSync
//
//  Created by Stephan Dowless on 1/12/24.
//

import SwiftUI

struct SexualOrientationSelectionView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    
    @Binding var selectedOrientation: SexualOrientationType?

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section("Select Orientation") {
                        ForEach(SexualOrientationType.allCases) { orientation in
                            HStack {
                                Text(orientation.description)
                                
                                Spacer()
                                
                                if selectedOrientation == orientation {
                                    Image(systemName: "checkmark")
                                }
                            }
                            .background(itemBackgroundColor)
                            .onTapGesture { selectedOrientation = orientation }
                        }
                    }
                }
            }
            .navigationTitle("Orientation")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
        }
    }
}

private extension SexualOrientationSelectionView {
    var itemBackgroundColor: Color {
        switch colorScheme {
        case .dark:
            return Color(.secondarySystemBackground)
        case .light:
            return .white
        @unknown default:
            return .clear
        }
    }
}

#Preview {
    SexualOrientationSelectionView(selectedOrientation: .constant(.straight))
}
