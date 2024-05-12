//
//  EditTodoItemView.swift
//  SwiftDataTodoList
//
//  Created by Marat on 07.05.2024.
//

import SwiftUI

struct EditTodoItemView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Bindable var todoItem: TodoItem
        
        var body: some View {
            NavigationStack {
                Form {
                    TextField("Название", text: $todoItem.title)
                    TextField("Описание", text: $todoItem.desc)
                    DatePicker("Дата", selection: $todoItem.dueDate)
                        .datePickerStyle(.graphical)
                }
                .navigationTitle("Обновить событие")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button("Готово") { dismiss() }
                    }
                }
            }
        }

}

#Preview {
    EditTodoItemView(todoItem: TodoItem(title: "todo1", desc: "description", type: TodoType.IMPORTANT_URGENT.rawValue, dueDate: .now))
}
