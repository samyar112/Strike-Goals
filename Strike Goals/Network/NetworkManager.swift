//
//  NetworkManager.swift
//  Strike Goals
//
//  Created by Samir Pandey on 6/4/24.
//

import SwiftUI

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
}

class NetworkManager: ObservableObject {
    static let shared = NetworkManager()
    
    @Published var quote: String = ""
    @Published var author: String = ""
    @Published var isLoading: Bool = false
    
    private init() {}
    
    func fetchData() {
        isLoading = true
        
        guard let url = URL(string: "https://zenquotes.io/api/random") else {
            print("Invalid URL")
            isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                
            }
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response")
                return
            }
            
            if let data = data {
                do {
                    let quotes = try JSONDecoder().decode([Quote].self, from: data)
                    if let quote = quotes.first {
                        DispatchQueue.main.async {
                            self.quote = quote.q
                            self.author = quote.a
                        }
                    }
                } catch {
                    print("Data not found")
                    
                }
            }
        }.resume()
    }
}
