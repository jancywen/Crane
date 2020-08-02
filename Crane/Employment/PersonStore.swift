//
//  PersonStore.swift
//  Crane
//
//  Created by wangwenjie on 2020/8/2.
//  Copyright © 2020 captain. All rights reserved.
//

import SwiftUI
import Combine

struct Person: Identifiable {
    var id: UUID
    var name: String
    var age: Int
}

final class PersonStore: ObservableObject {
    @Published var persons:[Person] = [
        .init(id: .init(), name: "Majid", age: 25),
        .init(id: .init(), name: "Jhon", age: 31),
        .init(id: .init(), name: "Fred", age: 37),
    ]
    
    func fetch() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {[weak self] in
            self?.persons.append(contentsOf: [
                .init(id: .init(), name: "LiLei", age: 31),
                .init(id: .init(), name: "Jani", age: 18),
            ])
        }
    }
}
