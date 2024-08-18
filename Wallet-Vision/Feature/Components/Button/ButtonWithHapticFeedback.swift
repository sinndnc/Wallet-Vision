//
//  ButtonWithHapticFeedback.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 18.08.2024.
//

import SwiftUI

struct ButtonWithHapticFeedback<Label : View>: View {
    
    
    var action : () -> Void
    @ViewBuilder var label : () -> Label
    
    var body: some View {
        Button {
            action()
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        } label: {
            label()
        }
    }
}

#Preview {
    ButtonWithHapticFeedback {
        
    } label: {
        
    }

}
