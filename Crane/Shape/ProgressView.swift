//
//  ProgressView.swift
//  Crane
//
//  Created by captain on 2020/8/13.
//  Copyright © 2020 captain. All rights reserved.
//

import SwiftUI

struct ProgressView: View {
    let progress: Double
    
    var body: some View {
        ProgressShape(progress: progress)
            .stroke(Color.blue,
                    style:
                StrokeStyle(lineWidth: 4,
                            lineCap: .round,
                            lineJoin: .round,
                            miterLimit: 0,
                            dash: [],
                            dashPhase: 0))
    }
}
