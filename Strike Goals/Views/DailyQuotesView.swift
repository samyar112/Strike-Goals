//
//  DailyQuotesView.swift
//  Strike Goals
//
//  Created by Samir Pandey on 6/4/24.
//

import SwiftUI

struct DailyQuotesView: View {
    @ObservedObject var networkManager = NetworkManager.shared
    
    var body: some View {
        VStack() {
            Text("Wisdom Bites")
                .fontWeight(.semibold)
                .font(.system(size: 15))
        }
        VStack {
            if networkManager.isLoading {
                ProgressView("Fetching Quote...")
            } else {
                VStack {
                    Text(networkManager.quote)
                        .padding([.top, .horizontal])
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("- \(networkManager.author)")
                        .padding([.trailing, .bottom])
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .background(VisualElement.myPink) // Set the background color of the box
                .cornerRadius(10) // Set the corner radius to create rounded corners
                Spacer()
            }
        }
        .onAppear {
            networkManager.fetchData()
        }
    }
}

#Preview {
    DailyQuotesView()
}
