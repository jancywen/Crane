//
//  ContentView.swift
//  Crane
//
//  Created by captain on 2020/7/28.
//  Copyright © 2020 captain. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isButtonVisible = true
    
    @State private var hiddenButton = true
    
    @State private var relyOn = true
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    self.isButtonVisible.toggle()
                }
            }) {
                Text("Press me")
            }
            if isButtonVisible {
                Button(action: {}, label: {Text("Hidden Button")})
            }
            
            Button(action: {
                self.hiddenButton.toggle()
            }) {
                Text("Hidden hidden")
            }
            
            if hiddenButton {
                Button(action: {}, label: {Text("Hidden Button")}).animation(.easeInOut)
            }
            
            Toggle(isOn: $relyOn.animation()) {
                Text("点我试试")
            }
            
            if relyOn {
                Button(action: {}) {
                    Text("消失 消失 消失")
                }.transition(.move(edge: .trailing))
                Button(action: {}) {
                    Text("zou 走 走")
                }.transition(.moveAndScale(edge: .bottom))
                Button(action: {}) {
                    Text("GO GO GO GO")
                }.transition(.moveOrFade(edge: .top))
            }
            
            
        }
    }
}


extension AnyTransition {
    static func moveAndScale(edge: Edge) -> AnyTransition {
        AnyTransition.move(edge: edge).combined(with: .scale(scale: 3))
    }
    static func moveOrFade(edge: Edge) -> AnyTransition {
        AnyTransition.asymmetric(insertion: .move(edge: edge), removal: .opacity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
