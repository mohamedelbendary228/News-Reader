//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Mohamed Elbendary on 18/06/2026.
//

import Combine
import Foundation

class NetworkManager: ObservableObject {

    @Published var posts: [Post] = []

    private let endpoint =
        "https://hn.algolia.com/api/v1/search?tags=front_page"

    func fetchPosts() {
        if let url = URL(string: endpoint) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeDat = data {
                        do {
                            let postsData = try decoder.decode(
                                PostData.self,
                                from: safeDat
                            )
                            DispatchQueue.main.async {
                                self.posts = postsData.hits
                            }
                        } catch {
                            print(error)
                        }
                    }

                }

            }
            task.resume()
        }
    }
}
