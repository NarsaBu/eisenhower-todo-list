//
//  Item.swift
//  eisenhower-todo-list
//
//  Created by Marat on 12.05.2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
