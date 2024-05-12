//
//  AddNewItemView.swift
//  SwiftDataTodoList
//
//  Created by Marat on 07.05.2024.
//

import SwiftUI

struct AddNewTodoItemView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var desc: String = ""
    @State private var type: TodoType = .IMPORTANT_URGENT
    @State private var dueDateIsOn: Bool = true
    @State private var dueDate: Date = .now
    
    var body: some View {
            NavigationStack {
                Form {
                    TextField("Название", text: $title)
                    TextField("Описание", text: $desc)
                    Picker("Тип События", selection: $type) {
                        ForEach(TodoType.allCases) { option in
                            Text(option.rawValue)
                        }
                    }
                    Toggle(isOn: $dueDateIsOn) {
                        Text("Выберите время")
                    }
                    dueDateIsOn ? DatePicker("Due Date", selection: $dueDate)
                        .datePickerStyle(.graphical) : nil
                }
                .navigationTitle("Новое событие")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("Отмена") { dismiss() }
                    }
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button("Сохранить") {
                            let todoItem: TodoItem
                            
                            if dueDateIsOn {
                                todoItem = TodoItem(title: title, desc: desc, type: type.rawValue, dueDate: dueDate)
                            } else {
                                todoItem = TodoItem(title: title, desc: desc, type: type.rawValue, dueDate: DateUtil().createTheLatestDate())
                            }
                            
                            context.insert(todoItem)
                            
                            title = ""
                            desc = ""
                            type = .IMPORTANT_URGENT
                            dueDate = .now
                            
                            dismiss()
                        }
                    }
                }
            }
        }
}

#Preview {
    AddNewTodoItemView()
}
