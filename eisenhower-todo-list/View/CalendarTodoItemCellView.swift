//
//  CalendarTodoItemCellView.swift
//  SwiftDataTodoList
//
//  Created by Marat on 10.05.2024.
//

import SwiftUI

struct CalendarTodoItemCellView: View {
    
    @Bindable var todoItem: TodoItem
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            Circle()
                .fill(indicatiorColor)
                .frame(width: 10, height: 10)
                .padding(4)
                .background(.white.shadow(.drop(color: .black.opacity(0.1), radius: 3)), in: .circle)
                .overlay {
                    Circle()
                        .frame(width: 50, height: 50)
                        .blendMode(.destinationOver)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                todoItem.toggle()
                            }
                        }
                }
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(todoItem.title)
                        .font(.system(size: 20, weight: .semibold))
                    Spacer()
                    Label("\(todoItem.dueDate.format("HH:mm"))", systemImage: "clock")
                        .font(.callout)
                }
                .hSpacing(.leading)
                
                Text(todoItem.desc)
                    .font(.callout)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(TodoUtil().determineRowColor(todo: todoItem))
            .clipShape(.rect(cornerRadius: 20))
            .onTapGesture {
                withAnimation(.snappy) {
                    todoItem.toggle()
                }
            }
        }
        .padding(.horizontal)
    }
    
    var indicatiorColor: Color {
        if todoItem.isCompleted {
            return .green
        }
        
        return todoItem.dueDate.isSameHour ? .black : (todoItem.dueDate.isPast ? .blue : .black)
    }
}

#Preview {
    CalendarTodoItemCellView(todoItem: TodoItem(title: "todo1", desc: "description", type: TodoType.IMPORTANT_URGENT.rawValue, dueDate: .now))
}
