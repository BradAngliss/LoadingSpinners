//
//  CircleArcSpinner.swift
//  LoadingSpinners
//
//  Created by Brad Angliss on 06/04/2024.
//

import Foundation
import SwiftUI

// TODO: Make an enum to pass in size, lineWidth, speed etc.

struct CircleArcSpinner: View {
    @State var rotatingArc = 0.0

    let ringColor: Color
    let arcColor: Color
    let lineWidth: CGFloat
    let size: CGFloat
    let speed: CGFloat

    init(ringColor: Color,
         arcColor: Color,
         lineWidth: CGFloat = 10,
         size: CGFloat = 50,
         speed: CGFloat = 0.8) {
        self.ringColor = ringColor
        self.arcColor = arcColor
        self.lineWidth = lineWidth
        self.size = size
        self.speed = speed
    }
    
    var body: some View {
        Group {
            ZStack {
                Circle()
                    .stroke(ringColor, lineWidth: lineWidth)
                    .frame(maxWidth: size, maxHeight: size)
                
                Arc(startAngle: .degrees(0),
                    endAngle: .degrees(90),
                    clockwise: true)
                .stroke(arcColor, lineWidth: lineWidth)
                .frame(maxWidth: size, maxHeight: size)
                .rotationEffect(.degrees(rotatingArc))
                .onAppear {
                    withAnimation(.linear(duration: 1)
                        .speed(speed).repeatForever(autoreverses: false)) {
                            rotatingArc = 360.0
                        }
                }
            }
        }
        .frame(maxWidth: size, maxHeight: size)
    }
}

#Preview {
    CircleArcSpinner(
        ringColor: .orange,
        arcColor: .green,
        lineWidth: 7,
        size: 50,
        speed: 0.8
    )
}
