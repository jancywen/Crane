//
//  PopoutView.swift
//  Crane
//
//  Created by captain on 2020/8/8.
//  Copyright © 2020 captain. All rights reserved.
//

import SwiftUI

struct PopoutView: View {
    
    @State private var showActionSheet = false
    @State private var showAlert = false
    
    @State private var actionSheetMessage: PopoutMessage? = nil
    @State private var alertMessage: PopoutMessage? = nil
    
    
    @State private var showModal = false
    
    @State private var showPopover = false
    
    var body: some View {
        VStack {
            // 绑定 bool 值
            Button("actionSheet") {
                self.showActionSheet = true
            }.actionSheet(isPresented: $showActionSheet) {
                ActionSheet(title: Text("ActionSheet"),
                            message: Text("message"),
                            buttons: [.cancel(),
                                      .default(Text("default")),
                                      .destructive(Text("destructive"))])
            }
            
            Button("Alert") {
                self.showAlert = true
            }.alert(isPresented: $showAlert) {
                Alert(title: Text("Alert"),
                      message: Text("message"),
                      primaryButton: Alert.Button.cancel(),
                      secondaryButton: .default(Text("Default")))
            }
            
            // 绑定 identifiable
            Button("action sheet binding identifiable") {
                self.actionSheetMessage = PopoutMessage(text: "action sheet binding identifiable")
            }.actionSheet(item: $actionSheetMessage) { message in
                ActionSheet(title: Text(message.text), message: Text(message.text))
            }
            
            Button("alert bind identifiable") {
                self.alertMessage = PopoutMessage(text: "alert binding identifiable")
            }.alert(item: $alertMessage) { message in
                Alert(title: Text(message.text), message: Text(message.text))
            }
            
            
            Button("modal") {
                self.showModal = true
            }.sheet(isPresented: $showModal) {
                ModalView(message: "modalview")
            }
            
            List {
            Button("Popover") {
                self.showPopover.toggle()
            }.popover(isPresented: $showPopover,  arrowEdge: .top) {
                Text("text")
            }
            }
            
            //TODO: fullScreenView
        }
    }
}

struct PopoutView_Previews: PreviewProvider {
    static var previews: some View {
        PopoutView()
    }
}


struct ModalView: View {
    
    @Environment(\.presentationMode) var presentation
    let message: String
    
    var body: some View {
        VStack {
            Text(message)
            Button("Dismiss") {
                self.presentation.wrappedValue.dismiss()
            }
        }
    }
    
}



struct PopoutMessage: Identifiable {
    let id = UUID()
    let text: String
}
