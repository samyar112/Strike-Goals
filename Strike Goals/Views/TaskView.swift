//
//  TaskView.swift
//  Strike Goals
//
//  Created by Samir Pandey on 6/4/24.
//

import SwiftUI

struct TaskView: View {
    @State private var selectedIndex: Int = 0
    @State private var dragOffset: Int = 0
    let tasks = [
        //Dummy Data.
        "Task 1",
        "Task 2",
        "Task 3",
        "Task 4",
        "Task 5",
        "Task 6"
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Task Name")
                .font(.headline)
                .padding(.horizontal, 32)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(tasks.indices, id: \.self) { index in
                        TaskItemView(title: tasks[index])
                            .onTapGesture {
                                selectedIndex = index
                                
                            }
                            .padding([.top, .horizontal])
                    }
                    
                }
                .padding([.top])
            }
            .frame(height: 200)
            
            .padding(32)
            
            Spacer()
        }
    }
}

struct TaskItemView: View {
    let title: String
    @State private var showModal = false
    
    var body: some View {
        Text(title)
            .font(.headline)
            .frame(width: 200, height: 200)
            .padding()
            .background(VisualElement.myPink)
            .cornerRadius(15)
            .shadow(radius: 10, y: 10)
            .onTapGesture {
                showModal = true
            }
            .sheet(isPresented: $showModal) {
                DateDetailsView(selectedDate: Date())
            }
        
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
