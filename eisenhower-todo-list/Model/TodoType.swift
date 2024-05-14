//
//  TodoType.swift
//  SwiftDataTodoList
//
//  Created by Marat on 07.05.2024.
//

import Foundation

enum TodoType: String, CaseIterable, Identifiable {
    
    var id : TodoType {
        self
    }
    
    case IMPORTANT_URGENT = "Важное срочное"
    case IMPORTANT_NON_URGENT = "Важное несрочное"
    case UNIMPORTANT_URGENT = "Неважное срочное"
    case UNIMPORTANT_NON_URGENT = "Неважное несрочное"
}
