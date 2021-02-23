//
//  TodosView.swift
//  Crane
//
//  Created by captain on 2020/8/17.
//  Copyright © 2020 captain. All rights reserved.
//

import SwiftUI


struct TodoItemView: View {
    let todo: Binding<Todo>
    var body: some View {
        HStack{
            Toggle(isOn: todo.isDone) {
                Text(todo.title.wrappedValue)
                    .strikethrough(todo.isDone.wrappedValue)
            }
        }
    }
}

struct TodosView: View {
    @EnvironmentObject var store: TodosStore
    @State private var draft: String = ""
    
    var body: some View {
        NavigationView {
            List {
                TextField("Type something...", text: $draft, onCommit: addTodo)
                ForEach(store.todos.indexed(), id: \.1.id) { index, _ in
                    TodoItemView(todo: self.$store.todos[index])
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
            }
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("Todos")
        }
    }
    
    private func delete(_ indexs: IndexSet) {
        store.todos.remove(atOffsets: indexs)
    }
    
    private func move(_ indexs: IndexSet, to offset: Int) {
        store.todos.move(fromOffsets: indexs, toOffset: offset)
    }
    
    private func addTodo() {
        let newTodo = Todo(title: draft, date: Date(), isDone: false, priority: 0)
        store.todos.insert(newTodo, at: 0)
        draft = ""
    }
}


struct TodosView_Previews: PreviewProvider {
    static var previews: some View {
        TodosView().environmentObject(TodosStore())
    }
}
