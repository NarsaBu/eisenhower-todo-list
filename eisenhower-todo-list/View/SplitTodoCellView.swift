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
                    .font(.system(size: 15))
                Spacer()
                Image(systemName: todoItem.isCompleted ? "checkmark" : "square")
                    .foregroundColor(.blue)
            }
            todoItem.dueDate == DateUtil().createTheLatestDate() ? nil : Text(todoItem.dueDate.formatted())
                .italic()
                .font(.system(size: 15))
        }
    }
}

#Preview {
    SplitTodoCellView(todoItem: TodoItem(title: "todo1", desc: "description", type: TodoType.IMPORTANT_URGENT.rawValue, dueDate: .now))
}
