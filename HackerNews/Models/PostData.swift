//
//  PostData.swift
//  HackerNews
//
//  Created by Mohamed Elbendary on 18/06/2026.
//

import Foundation

nonisolated
struct PostData: Codable {
    let hits: [Post]
}


struct Post: Codable, Identifiable {
    let objectID: String
    let points: Int
    let title: String
    let url: String

    var id: String {
        return objectID
    }
}
