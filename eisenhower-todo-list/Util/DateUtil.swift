//
//  DateUtil.swift
//  eisenhower-todo-list
//
//  Created by Marat on 12.05.2024.
//

import Foundation

class DateUtil {
    
    func createTheLatestDate() -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = 2099
        dateComponents.month = 3
        dateComponents.day = 10
        
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(from: dateComponents)!
    }
}
