//
//  CalendarView.swift
//  Strike Goals
//
//  Created by Samir Pandey on 6/4/24.
//

import SwiftUI

struct CalendarView: View {
    @State private var selectedDate: Date = Date()
    @State private var isButtonTapped = false
    
    
    var body: some View {
        
        HStack {
            Text("Date: \(selectedDate, formatter: dateFormatter)")
            Spacer()
            Button(action: {
                    isButtonTapped.toggle()
                }) {
                    Image(systemName: isButtonTapped ? VisualElement.buttonUp : VisualElement.buttonDown)
                        .foregroundColor(.black)
                        .imageScale(.large)
                }
            }
            .padding(.all)
            .background(VisualElement.myPink)
            .cornerRadius(20)
            
            if isButtonTapped {
                DatePicker("", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                    .clipped()
            
        }
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
