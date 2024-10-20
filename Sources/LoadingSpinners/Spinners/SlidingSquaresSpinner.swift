//
//  SlidingSquaresSpinner.swift
//  LoadingSpinners
//
//  Created by Brad Angliss on 07/04/2024.
//

import Foundation
import SwiftUI

struct SlidingSquaresSpinner: View {
    let speed: Double = 0.5
    let size: Double = 30
    let interval: Double = 6.5
    let spacing: Double = 5
    
    var body: some View {
        bounceBallSpinner
    }
    
    @ViewBuilder
    private var bounceBallSpinner: some View {
        
        VStack(spacing: spacing) {
            HStack(spacing: spacing) {
                Group {
                    SlidingSquare() { offsetX, offsetY in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.easeInOut(duration: speed)) {
                                offsetX = size + spacing
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation(.easeInOut(duration: speed)) {
                                offsetY = size + spacing
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                            withAnimation(.easeInOut(duration: speed)) {
                                offsetX = 0
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            withAnimation(.easeInOut(duration: speed)) {
                                offsetY = 0
                            }
                        }
                    }
                }
                .frame(width: 30, height: 30)
            }
            
            HStack {
                Group {
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(width: (size * 2) + spacing, height: 30)
        }
    }
}

struct SlidingSquare: View {
    
    @State var offsetX: Double = 0.0
    @State var offsetY: Double = 0.0
    @State private var animationTimer: Timer?
    
    let speed: Double = 0.5
    let size: Double = 30
    let interval: Double = 6.5
    let spacing: Double = 5
    
    let animation: (inout Double, inout Double) -> Void
    
    var body: some View {
        Group {
            Rectangle()
                .fill(Color(hex: "#4C8577"))
                .cornerRadius(8)
                .frame(width: size, height: size)
                .offset(x: offsetX, y: offsetY)
                .onAppear {
                    animation(&offsetX, &offsetY)
                    animationTimer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
                        
                        Task { @MainActor in
                            animation(&offsetX, &offsetY)
                        }
                    }
                    
                }
        }
        .frame(width: 30, height: 30)
    }
}

#Preview {
    SlidingSquaresSpinner()
}
