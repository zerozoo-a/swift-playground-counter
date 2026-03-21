//
//  Todo.swift
//  abc
//
//  Created by zoo on 3/21/26.
//

import SwiftUI

struct TodoItem: Identifiable {
    let id = UUID()
    var title: String
    var isDone: Bool
    let createdAt: Date = Date()
    let editedAt: Date? = nil
    let deletedAt: Date? = nil
}

struct TodoSwiftUIView: View {
    @State private var todos: [TodoItem] = []
    @FocusState private var focusedId: UUID?

    var body: some View {
        List {
            ForEach($todos) { $todo in
                TextField("", text: $todo.title)
                    .id(todo.id)
                    .focused($focusedId, equals: todo.id)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .onSubmit {
                        if todo.title.isEmpty {
                            todos.removeAll { $0.id == todo.id }
                        } else {
                            guard todo.title != "" else { return }
                            appendNewTodo()
                        }
                    }
            }

            Color.clear
                .frame(maxWidth: .infinity, minHeight: 900)
                .contentShape(Rectangle())
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .onTapGesture {
                    guard todos.last?.title != "" else { return }
                    appendNewTodo()
                }
        }
    }
    
    func appendNewTodo() {
        let newTodo = TodoItem(title: "", isDone: false)
        todos.append(newTodo)
        DispatchQueue.main.async {
            focusedId = newTodo.id
        }
    }
}

#Preview {
    TodoSwiftUIView()
}
