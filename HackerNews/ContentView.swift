//
//  ContentView.swift
//  HackerNews
//
//  Created by Mohamed Elbendary on 18/06/2026.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()

    var body: some View {
        NavigationView {
            List{
                ForEach(networkManager.posts) { post in
                    HStack {
                        Text("\(post.points)")
                        Text(post.title)
                    }
                }
                .listRowSeparator(.hidden)
                .listRowInsets([.bottom], 5)
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle(Text("Hacker News"))

        }
        .preferredColorScheme(.dark)
        .onAppear {
            networkManager.fetchPosts()
        }
    }
}

#Preview {
    ContentView()
}
