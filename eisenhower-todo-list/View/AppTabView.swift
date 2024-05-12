//
//  AppTabView.swift
//  SwiftDataTodoList
//
//  Created by Marat on 07.05.2024.
//

import SwiftUI
import SwiftData

struct AppTabView: View {
    
    //TODO: 1. TodoListView(): if isCompleted == true -> to the end of the list
    //TODO: 1. CalendarView(): point under dates with events
    //TODO: 3. add pagination to the TodoListView() and to the SplitTodoView()
    //TODO: 4. import and export data
    //TODO: 5. sort and filter dynamic alignment
    
    @Query(filter: #Predicate<TodoItem> { todo in
        todo.isCompleted == false
    }) var todos: [TodoItem]
    
    var body: some View {
        TabView {
            SplitTodoView()
                .tabItem {
                    Image(systemName: "note")
                    Text("Матрица Эйзенхауэра")
                }
            AddNewTodoItemView()
                .tabItem {
                    Image(systemName: "plus")
                    Text("Добавить Событие")
                }
            TodoListView()
                .tabItem {
                    Image(systemName: "note.text")
                    Text("Список событий")
                }
            .badge(todos.count)
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Календарь")
                }

        }
    }
}

#Preview {
    AppTabView()
}
