//
//  ShapeContentView.swift
//  Crane
//
//  Created by captain on 2020/8/13.
//  Copyright © 2020 captain. All rights reserved.
//

import SwiftUI

struct ShapeContentView: View {
    var body: some View {
        
        VStack {
            ProgressShape(progress: 0.2).trim(from: 0, to: 0.5)
                .frame(width: 200, height: 200, alignment: .center)
                .foregroundColor(.blue)
            
        }
    }
}

struct ShapeContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeContentView()
    }
}
