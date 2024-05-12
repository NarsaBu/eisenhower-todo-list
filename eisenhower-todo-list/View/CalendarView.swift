//
//  CalendarView.swift
//  SwiftDataTodoList
//
//  Created by Marat on 10.05.2024.
//

import SwiftUI

struct CalendarView: View {
    
    @State private var selectedDate: Date = .init()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            DatePicker("Дата", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(.graphical)
            ScrollView(.vertical) {
                VStack {
                    CalendarTodoItemVIew(date: selectedDate)
                }
                .hSpacing(.center)
                .vSpacing(.center)
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    CalendarView()
}
