//
//  TodoListVIew.swift
//  SwiftDataTodoList
//
//  Created by Marat on 07.05.2024.
//

import SwiftUI
import SwiftData

enum SortOrder: String, Identifiable, CaseIterable {
    case title, dueDate, type
    
    var id: Self {
        self
    }
}

struct TodoListView: View {
    @State private var sortOrder = SortOrder.dueDate
    @State private var typeFilter = TodoType.IMPORTANT_URGENT
    @State private var shouldFilterByType: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Picker("", selection: $sortOrder) {
                        ForEach(SortOrder.allCases) { sortOrder in
                            Text("Сортировать по: \(sortOrder.rawValue)").tag(sortOrder)
                        }
                    }
                    .buttonStyle(.bordered)
                    Picker("", selection: $typeFilter) {
                        ForEach(TodoType.allCases) { todoType in
                            Text("\(todoType.rawValue)").tag(todoType)
                        }
                    }
                    .buttonStyle(.bordered)
                }
                Toggle(isOn: $shouldFilterByType) {
                    Text("Включить фильтр типов:")
                }
                .padding()
            }
            TodoList(sortOrder: sortOrder, typeFilter: typeFilter.rawValue, shouldFilterByType: shouldFilterByType)
        }
    }
}

#Preview {
    TodoListView()
}
