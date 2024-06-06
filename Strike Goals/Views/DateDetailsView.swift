//
//  DateDetailsView.swift
//  Strike Goals
//
//  Created by Samir Pandey on 6/4/24.
//

import SwiftUI

struct DateDetailsView: View {
    var selectedDate: Date
    
    var body: some View {
        VStack {
            Text("Details for \(selectedDate, formatter: dateFormatter)")
                .font(.title)
                .padding()
            Text("Your Goals for today")
            // You can add more details or actions related to the selected date here
        }
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
}
