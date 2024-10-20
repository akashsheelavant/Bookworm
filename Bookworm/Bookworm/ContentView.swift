//
//  ContentView.swift
//  Bookworm
//
//  Created by Akash Sheelavant on 9/19/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
            
    @Query var books: [Book]
    
    @State private var showingAddScreen = false
    @State private var rememberMe = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    
                }
            }
                    .navigationTitle("Bookworm")
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button("Add Book", systemImage: "plus") {
                                showingAddScreen.toggle()
                            }
                        }
                    }
                    .sheet(isPresented: $showingAddScreen) {
                        AddBookView()
                    }
        }
    }
}

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
    }
}

#Preview {
    ContentView()
}
