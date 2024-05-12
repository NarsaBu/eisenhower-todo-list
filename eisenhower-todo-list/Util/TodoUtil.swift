//
//  TodoUtil.swift
//  eisenhower-todo-list
//
//  Created by Marat on 12.05.2024.
//

import SwiftUI
import Foundation

class TodoUtil {
    
    func determineRowColor(todo: TodoItem) -> Color {
        let todoType = TodoType(rawValue: todo.type)
        
        switch todoType {
        case .some(.IMPORTANT_URGENT):
            return Color.pink
        case .some(.IMPORTANT_NON_URGENT):
        return Color.green
        case .some(.UNIMPORTANT_URGENT):
            return Color.yellow
        case .some(.UNIMPORTANT_NON_URGENT):
            return Color.gray
        case .none:
            return Color.clear
        }
    }
}
