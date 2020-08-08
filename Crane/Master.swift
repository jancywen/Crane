//
//  Master.swift
//  Crane
//
//  Created by captain on 2020/8/8.
//  Copyright © 2020 captain. All rights reserved.
//

import SwiftUI

struct Master: View {
    
    @State var selection: Int? = nil
    
    private let messages = [
        "How do you do", "How are you"
    ]
    
    var body: some View {
        
        NavigationView {
            VStack {
                NavigationLink(destination: Details(), tag: 2, selection: $selection) {
                    Button("Press me") {
                        self.selection = 2
                    }
                }
                List(messages, id: \.self) { message in
                    NavigationLink(destination: DetailView(message: message)) {
                        Text(message)
                    }
                }.navigationBarTitle("Messages")

                ForEach(messages, id: \.self) { message in
                    NavigationLink(destination: DetailView(message: message)) {
                        Text(message)
                    }
                }
            }
        }
    }
}

struct Master_Previews: PreviewProvider {
    static var previews: some View {
        Master()
    }
}

struct Details: View {
    @Environment(\.presentationMode) var presentation
    var body: some View {
        Group {
            Text("Details")
            Button("pop bac") {
                self.presentation.wrappedValue.dismiss()
            }
        }
    }
}

struct DetailView: View {
    let message: String
    var body: some View {
            VStack {
                NavigationLink(destination: Details()) {
                    Text(message).font(.largeTitle)
                }
                
            }.navigationBarTitle(message)

    }
}
