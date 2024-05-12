//
//  SplitTodoListShort.swift
//  SwiftDataTodoList
//
//  Created by Marat on 10.05.2024.
//

import SwiftUI
import SwiftData

struct SplitTodoListShort: View {
    
    @Environment(\.modelContext) private var context
    @Query var todos: [TodoItem]
    var backgroundColor: Color
    var padding: Edge.Set
    
    init(filter: String, backgroundColor: Color, padding: Edge.Set) {
        _todos = Query(filter: #Predicate<TodoItem> { todoItem in
            todoItem.type == filter
        }, sort: \TodoItem.dueDate)
        
        self.backgroundColor = backgroundColor
        self.padding = padding
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(todos) { todo in
                    SplitTodoCellView(todoItem: todo)
                        .onTapGesture {
                            todo.toggle()
                        }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        context.delete(todos[index])
                    }
                }
                
            }
            .background(backgroundColor)
            .scrollContentBackground(.hidden)
            .overlay { buildOverlay(todos: todos) }
        }
        .padding(padding)
    }
    
    private func buildOverlay(todos: [TodoItem]) -> AnyView? {
        if todos.isEmpty {
            return AnyView(ContentUnavailableView(label: {
                Label("Событий нет", systemImage: "list.bullet.rectangle.portrait")
            }, description: {
                Text("Начните добавлять события в свой список.")
            }))
        }
        
        return nil
    }
}

#Preview {
    SplitTodoListShort(filter: TodoType.IMPORTANT_URGENT.rawValue, backgroundColor: .pink, padding: .top)
}
