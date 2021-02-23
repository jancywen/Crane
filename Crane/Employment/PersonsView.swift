//
//  PersonsView.swift
//  Crane
//
//  Created by wangwenjie on 2020/8/2.
//  Copyright © 2020 captain. All rights reserved.
//


import Foundation
//extension RandomAccessCollection {
//    func indexed() -> Array<(offset: Int, element: Element)> {
//        Array(enumerated())
//    }
//}


import SwiftUI

struct PersonsView: View {
    
    @ObservedObject var store: PersonStore
    
    var body: some View {
//        NavigationView{
//            List(store.persons) { person in
//                VStack(alignment: .leading, spacing: 10) {
//                    Text(person.name).font(.headline)
//                    Text("Age: \(person.age)").font(.subheadline).foregroundColor(.secondary)
//                }
//            }
//        }.navigationBarTitle(Text("Persons"))
        
        NavigationView {
            List {
                ForEach(store.persons.indexed(), id: \.1.id) {index, person in
                    NavigationLink(destination: EditingView(person: self.$store.persons[index])) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(person.name).font(.headline)
                            Text("Age: \(person.age)").font(.subheadline).foregroundColor(.secondary)
                        }
                    }
                }
            }
            .onAppear(perform: store.fetch)
        .navigationBarTitle(Text("Persons"))
        }
    }
}

//struct PersonsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonsView()
//    }
//}
