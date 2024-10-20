//
//  ArcCircle.swift
//  LoadingSpinners
//
//  Created by Brad Angliss on 06/04/2024.
//

import Foundation
import SwiftUI

struct LayeredArcSpinner: View {
    
    @State var innerRotating = 0.0
    @State var middleRotating = 0.0
    @State var outerRotating = 0.0

    let color: Color
    let lineWidth: CGFloat
    let size: CGFloat
    let speed: CGFloat

    init(color: Color,
         lineWidth: CGFloat = 5,
         size: CGFloat = 125,
         speed: CGFloat = 1.6
    ) {
        self.color = color
        self.lineWidth = lineWidth
        self.size = size
        self.speed = speed
    }
    
    var body: some View {
        ZStack {
            Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
                .stroke(color.opacity(0.3), lineWidth: lineWidth)
                .frame(width: size, height: size)
                .rotationEffect(.degrees(outerRotating))
                .onAppear {
                    withAnimation(.linear(duration: 1)
                        .speed(speed / 3).repeatForever(autoreverses: false)) {
                            outerRotating = 360.0
                        }
                }
            Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
                .stroke(color.opacity(0.6), lineWidth: lineWidth)
                .frame(width: size - 25, height: size - 25)
                .rotationEffect(.degrees(middleRotating))
                .onAppear {
                    withAnimation(.linear(duration: 1)
                        .speed((speed / 3) * 2.0)
                        .repeatForever(autoreverses: false)) {
                            middleRotating = 360.0
                        }
                }
            Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
                .stroke(color, lineWidth: lineWidth)
                .frame(width: size - 50, height: size - 50)
                .rotationEffect(.degrees(innerRotating))
                .onAppear {
                    withAnimation(.linear(duration: 1)
                        .speed(speed).repeatForever(autoreverses: false)) {
                            innerRotating = 360.0
                        }
                }
        }
    }
}

#Preview {
    LayeredArcSpinner(color: .orange)
}
