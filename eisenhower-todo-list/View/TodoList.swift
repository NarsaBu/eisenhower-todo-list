//
//  TodoList.swift
//  SwiftDataTodoList
//
//  Created by Marat on 10.05.2024.
//

import SwiftUI
import SwiftData

struct TodoList: View {
    @Environment(\.modelContext) private var context
    @State private var isShowingItemSheet = false
    @State private var todoToEdit: TodoItem?
    @Query var todos: [TodoItem]
    
    init(sortOrder: SortOrder, typeFilter: String, shouldFilterByType: Bool) {
        let sortDescriptors: [SortDescriptor<TodoItem>] = switch sortOrder {
        case .title:
            [SortDescriptor(\TodoItem.title)]
        case .dueDate:
            [SortDescriptor(\TodoItem.dueDate)]
        case .type:
            [SortDescriptor(\TodoItem.type)]
        }
        
        if shouldFilterByType {
            _todos = Query(filter: #Predicate<TodoItem> { todoItem in
                todoItem.type == typeFilter
            }, sort: sortDescriptors)
        } else {
            _todos = Query(sort: sortDescriptors)
        }
    }
    
    var body: some View {
        List {
            ForEach(todos) { todo in
                TodoItemCell(todoItem: todo)
                    .onTapGesture {
                        todo.toggle()
                    }
                    .onLongPressGesture {
                        todoToEdit = todo
                    }
                    .listRowBackground(TodoUtil().determineRowColor(todo: todo))
            }
            .onDelete { indexSet in
                for index in indexSet {
                    context.delete(todos[index])
                }
            }
        }
        .navigationTitle("Список событий")
        .navigationBarTitleDisplayMode(.large)
        .sheet(isPresented: $isShowingItemSheet) { AddNewTodoItemView() }
        .sheet(item: $todoToEdit) { todo in
            EditTodoItemView(todoItem: todo)
        }
        .overlay {
            if todos.isEmpty {
                ContentUnavailableView(label: {
                    Label("Событий нет", systemImage: "list.bullet.rectangle.portrait")
                }, description: {
                    Text("Начните добавлять события в свой список.")
                }, actions:  {
                    Button("Добавить событие") { isShowingItemSheet = true }
                })
                .offset(y: -60)
            }
        }
    }
}

#Preview {
    TodoList(sortOrder: .title, typeFilter: TodoType.IMPORTANT_URGENT.rawValue, shouldFilterByType: true)
}
