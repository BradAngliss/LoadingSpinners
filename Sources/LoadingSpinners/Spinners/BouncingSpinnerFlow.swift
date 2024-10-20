//
//  BouncingSpinnerFlow.swift
//  LoadingSpinners
//
//  Created by Brad Angliss on 06/04/2024.
//

import Foundation
import SwiftUI

struct BouncingSpinnerFlow: View {
    @State var rotate = 0.0
    @State var ball1: Double? = nil
    @State var ball2: Double? = nil
    @State var ball3: Double? = nil
    @State var ball4: Double? = nil
    @State var ball5: Double? = nil
    
    var body: some View {
        bounceBallSpinner
    }
    
    @ViewBuilder
    private var bounceBallSpinner: some View {
        let animationTime: Double = 0.6
        let circleSize: Double = 20
        let bounceHeight: Double = 30
        let fillColour: Color = .green
        
        LazyHStack {
            Circle()
                .fill(fillColour)
                .frame(width: circleSize)
                .offset(y: -50 + (ball1 ?? 0))
                .onAppear {
                    withAnimation(Animation.easeOut(duration: animationTime)
                        .delay(0)
                        .repeatForever(autoreverses: true))
                    {
                        ball1 = -bounceHeight
                    }
                }
            Circle()
                .fill(fillColour)
                .frame(width: circleSize)
                .offset(y: -50 + (ball2 ?? 0))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.125) {
                        withAnimation(Animation.easeOut(duration: animationTime)
                            .repeatForever(autoreverses: true))
                        {
                            ball2 = -bounceHeight
                        }
                    }
                }
            Circle()
                .fill(fillColour)
                .frame(width: circleSize)
                .offset(y: -50 + (ball3 ?? 0))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation(Animation.easeOut(duration: animationTime)
                            .repeatForever(autoreverses: true))
                        {
                            ball3 = -bounceHeight
                        }
                    }
                }
            Circle()
                .fill(fillColour)
                .frame(width: circleSize)
                .offset(y: -50 + (ball4 ?? 0))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.275) {
                        withAnimation(Animation.easeOut(duration: animationTime)
                            .repeatForever(autoreverses: true))
                        {
                            ball4 = -bounceHeight
                        }
                    }
                }
            Circle()
                .fill(fillColour)
                .frame(width: circleSize)
                .offset(y: -50 + (ball5 ?? 0))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                        withAnimation(Animation.easeOut(duration: animationTime)
                            .repeatForever(autoreverses: true))
                        {
                            ball5 = -bounceHeight
                        }
                    }
                }
        }
        .frame(width: 50, height: 50)
    }
}

#Preview {
    BouncingSpinnerFlow()
}
