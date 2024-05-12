//
//  TodoCellView.swift
//  SwiftDataTodoList
//
//  Created by Marat on 07.05.2024.
//

import SwiftUI

struct TodoItemCell: View {
    let todoItem: TodoItem
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(todoItem.title)
                Spacer()
                Image(systemName: todoItem.isCompleted ? "checkmark" : "square")
                    .foregroundColor(.blue)
            }
            todoItem.desc == "" ? nil : Text("\n\(todoItem.desc)").italic().bold()
            todoItem.dueDate == DateUtil().createTheLatestDate() ? nil : Text("дата: \(todoItem.dueDate.formatted())").italic()
        }
    }
}

#Preview {
    TodoItemCell(todoItem: TodoItem(title: "todo1", desc: "description", type: TodoType.IMPORTANT_URGENT.rawValue, dueDate: .now))
}
