//
//  SplitTodoView.swift
//  SwiftDataTodoList
//
//  Created by Marat on 08.05.2024.
//

import SwiftUI
import SwiftData

struct SplitTodoView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    VStack {
                        NavigationLink(destination: SplitTodoListExtended(typeFilter: TodoType.IMPORTANT_URGENT.rawValue)) {
                            Text(TodoType.IMPORTANT_URGENT.rawValue)
                        }
                        SplitTodoListShort(filter: TodoType.IMPORTANT_URGENT.rawValue, backgroundColor: .pink, padding: .top)
                    }
                    VStack {
                        NavigationLink(destination: SplitTodoListExtended(typeFilter: TodoType.IMPORTANT_NON_URGENT.rawValue)) {
                            Text(TodoType.IMPORTANT_NON_URGENT.rawValue)
                        }
                        SplitTodoListShort(filter: TodoType.IMPORTANT_NON_URGENT.rawValue, backgroundColor: .green, padding: .top)
                    }
                }
                HStack {
                    VStack {
                        NavigationLink(destination: SplitTodoListExtended(typeFilter: TodoType.UNIMPORTANT_URGENT.rawValue)) {
                            Text(TodoType.UNIMPORTANT_URGENT.rawValue)
                        }
                        SplitTodoListShort(filter: TodoType.UNIMPORTANT_URGENT.rawValue, backgroundColor: .yellow, padding: .bottom)
                    }
                    VStack {
                        NavigationLink(destination: SplitTodoListExtended(typeFilter: TodoType.UNIMPORTANT_NON_URGENT.rawValue)) {
                            Text(TodoType.UNIMPORTANT_NON_URGENT.rawValue)
                        }
                        SplitTodoListShort(filter: TodoType.UNIMPORTANT_NON_URGENT.rawValue, backgroundColor: .gray, padding: .bottom)
                    }
                }
            }
        }
    }
}

#Preview {
    SplitTodoView()
}
