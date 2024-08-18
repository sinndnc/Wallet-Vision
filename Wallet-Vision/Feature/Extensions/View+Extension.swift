//
//  View+Extension.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 17.08.2024.
//

import SwiftUI


struct HapticFeedbackModifier : ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            }
    }
}

extension View {
    
    func hapticFeedback() -> some View {
        modifier(HapticFeedbackModifier())
    }
    
}
