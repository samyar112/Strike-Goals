//
//  ContentView.swift
//  Strike Goals
//
//  Created by Samir Pandey on 6/4/24.
//
import SwiftUI

struct ContentView: View {
    @State private var isHeartFilled = false
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    CalendarView()
                    TaskView()
                    DailyQuotesView()
                    Button(action: {
                        isHeartFilled.toggle()
                    }) {
                        Image(systemName: isHeartFilled ? "heart.fill" : "heart")
                            .imageScale(.large)
                            .foregroundColor(isHeartFilled ? .red : .gray)
                            .padding()
                    }
                    
                    Text("Hello Angelu! I love you")
                    Text("Here's your Calender!")
                }
                .padding()
                Spacer()
            }
            
            .navigationBarTitle("Your Goals", displayMode: .large)
            .background(VisualElement.emeraldGreen)
        }
    }
}

#Preview {
    ContentView()
}

