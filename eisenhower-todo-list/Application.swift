//
//  eisenhower_todo_listApp.swift
//  eisenhower-todo-list
//
//  Created by Marat on 12.05.2024.
//

import SwiftUI
import SwiftData

@main
struct Application: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            TodoItem.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            AppTabView()
        }
        .modelContainer(sharedModelContainer)
    }
}
