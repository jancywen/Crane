//
//  ProgressShape.swift
//  Crane
//
//  Created by captain on 2020/8/13.
//  Copyright © 2020 captain. All rights reserved.
//

import SwiftUI

struct ProgressShape: Shape {
    let progress: Double
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                    radius: rect.width / 2,
                    startAngle: .radians(1.5 * .pi),
                    endAngle: .init(radians: 2 * Double.pi * progress + 1.5 * .pi),
                    clockwise: false)
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        return path
    }
}
