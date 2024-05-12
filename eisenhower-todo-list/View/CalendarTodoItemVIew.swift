//
//  CalendarTodoItemVIew.swift
//  SwiftDataTodoList
//
//  Created by Marat on 12.05.2024.
//

import SwiftUI
import SwiftData

struct CalendarTodoItemVIew: View {
    
    @State var date: Date
    @Query private var todos: [TodoItem]
    
    init(date: Date) {
        self.date = date
        
        let calendar = Calendar.current
        let startDate = calendar.startOfDay(for: date)
        let endDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
        let predicate = #Predicate<TodoItem> {
            return $0.dueDate >= startDate && $0.dueDate < endDate
        }
        
        let sortDesctiptor = [
            SortDescriptor(\TodoItem.dueDate)
        ]
        
        self._todos = Query(filter: predicate, sort: sortDesctiptor, animation: .snappy)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(todos) { todo in
                CalendarTodoItemCellView(todoItem: todo)
                    .background(alignment: .leading) {
                        if todos.last?.id != todo.id {
                            Rectangle()
                                .frame(width: 1)
                                .offset(x: 24, y: 45)
                        }
                    }
            }
        }
        .padding(.top, 15)
    }
}

#Preview {
    var dateComponents = DateComponents()
    dateComponents.year = 2024
    dateComponents.month = 5
    dateComponents.day = 17
    
    let calendar = Calendar(identifier: .gregorian)
    let date = calendar.date(from: dateComponents)!
    
    return CalendarTodoItemVIew(date: date)
}
