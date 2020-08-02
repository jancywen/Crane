//
//  GestureView.swift
//  Crane
//
//  Created by wangwenjie on 2020/8/2.
//  Copyright © 2020 captain. All rights reserved.
//

import SwiftUI

struct GestureView: View {
    
    @GestureState var isLongPressed = false
    
    
    var body: some View {
        
        let longPress = LongPressGesture(minimumDuration: 2).updating($isLongPressed) { (value, state, transcation) in
//            state = value
            
            print("Value \(value)")
            print("State: \(state)")
        }
        
        return Rectangle()
            .fill(isLongPressed ? Color.purple : Color.red)
            .frame(width: 300, height: 300)
            .cornerRadius(8)
            .shadow(radius: 8)
            .padding()
            .scaleEffect(isLongPressed ? 1.1 : 1)
            .gesture(longPress)
            .animation(.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2))
    }
}

struct GestureView_Previews: PreviewProvider {
    static var previews: some View {
        GestureView()
    }
}
