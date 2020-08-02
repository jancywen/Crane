//
//  EditingView.swift
//  Crane
//
//  Created by wangwenjie on 2020/8/2.
//  Copyright © 2020 captain. All rights reserved.
//

import SwiftUI

struct EditingView: View {
    
    @Environment(\.presentationMode) var presentation
    @Binding var person: Person
    
    var body: some View {
        Form {
            Section(header: Text("Personal information")) {
                TextField("type someting...", text: $person.name)
                Stepper(value: $person.age) {
                    Text("Age: \(person.age)")
                }
            }
            
            Section {
                Button("Save") {
                    self.presentation.wrappedValue.dismiss()
                }
            }
        }.navigationBarTitle(Text(person.name))
    }
}

//struct EditingView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditingView()
//    }
//}
