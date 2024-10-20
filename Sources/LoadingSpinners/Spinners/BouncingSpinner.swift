//
//  BouncingSpinner.swift
//  LoadingSpinners
//
//  Created by Brad Angliss on 06/04/2024.
//

import Foundation
import SwiftUI

struct BouncingSpinner: View {
    let color: Color
    let speed: Double
    let ballsCount: Int

    init(color: Color,
         speed: Double = 0.3,
         ballsCount: Int = 5
    ) {
        self.color = color
        self.speed = speed
        self.ballsCount = ballsCount
    }
    
    var body: some View {
        bounceBallSpinner
    }
    
    @ViewBuilder
    private var bounceBallSpinner: some View {
        HStack {
            ForEach(0..<ballsCount, id: \.self) {
                BouncingBall(
                    color: color,
                    speed: speed,
                    delay: Double($0) * 0.2
                )
            }
        }
    }
}

struct BouncingBall: View {
    @State var ballOffset: Double? = nil
    
    let color: Color
    let speed: Double
    let delay: Double

    let ballSize: Double = 20
    let bounceHeight: Double = 20
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: ballSize)
            .offset(y: -50 + (ballOffset ?? 0))
            .onAppear {
                withAnimation(Animation.easeOut(duration: speed)
                    .delay(delay)
                    .repeatForever(autoreverses: true))
                {
                    ballOffset = -bounceHeight
                }
            }
    }
}

#Preview {
    BouncingSpinner(
        color: .red,
        speed: 0.3,
        ballsCount: 5
    )
}
