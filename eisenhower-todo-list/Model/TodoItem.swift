//
//  Expense.swift
//  SwiftDataTodoList
//
//  Created by Marat on 07.05.2024.
//

import Foundation
import SwiftData

@Model
class TodoItem {
    var id: UUID = UUID()
    var title: String
    var desc: String
    var dueDate: Date
    var type: String
    var isCompleted: Bool = false
    
    init(title: String, desc: String, type: String, dueDate: Date) {
        self.title = title
        self.desc = desc
        self.dueDate = dueDate
        self.type = type
    }
    
    func toggle() {
        isCompleted = !isCompleted
    }
}
