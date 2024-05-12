//
//  SplitTodoCellView.swift
//  SwiftDataTodoList
//
//  Created by Marat on 08.05.2024.
//

import SwiftUI

struct SplitTodoCellView: View {
    let todoItem: TodoItem
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(todoItem.title)
                Spacer()
                Image(systemName: todoItem.isCompleted ? "checkmark" : "square")
                    .foregroundColor(.blue)
            }
        }
    }
}

#Preview {
    SplitTodoCellView(todoItem: TodoItem(title: "todo1", desc: "description", type: TodoType.IMPORTANT_URGENT.rawValue, dueDate: .now))
}
