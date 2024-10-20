//
//  Arc.swift
//  LoadingSpinners
//
//  Created by Brad Angliss on 20/10/2024.
//

import SwiftUI

struct Arc: Shape {
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: rect.width/2,
            startAngle: modifiedStart,
            endAngle: modifiedEnd,
            clockwise: !clockwise)
        
        return path
    }
}
