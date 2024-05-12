//
//  SplitTodoListExtended.swift
//  SwiftDataTodoList
//
//  Created by Marat on 10.05.2024.
//

import SwiftUI

struct SplitTodoListExtended: View {
    
    var typeFilter: String
    
    var body: some View {
        NavigationView {
            TodoList(sortOrder: SortOrder.dueDate, typeFilter: typeFilter, shouldFilterByType: true)
        }
    }
}

#Preview {
    SplitTodoListExtended(typeFilter: TodoType.IMPORTANT_URGENT.rawValue)
}
