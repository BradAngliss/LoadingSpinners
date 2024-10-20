//
//  SquareActivityIndicator.swift
//  LoadingSpinners
//
//  Created by Brad Angliss on 07/04/2024.
//

import Foundation
import SwiftUI

struct ShrinkGrowArc: View {
    @State var rotate = 0.0
    @State var outerRotating = 0.0
    @State var size = 0.0

    let strokeColour: Color = .red
    let lineWidth: CGFloat = 10
    let maxDims: CGFloat = 125
    let maxSpeed: CGFloat = 1.6

    var body: some View {
        Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
            .stroke(strokeColour, lineWidth: lineWidth)
            .frame(width: maxDims, height: maxDims)
            .rotationEffect(.degrees(outerRotating))
            .onAppear {
                  withAnimation(.linear(duration: 1)
                    .speed(maxSpeed / 3).repeatForever(autoreverses: false)) {
                        outerRotating = 360.0
                      }
              }
    }
}

#Preview {
    ShrinkGrowArc()
}
