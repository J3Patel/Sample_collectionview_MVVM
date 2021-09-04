//
//  UserPostsDataModel.swift
//  CuratedPlansDetailScreen
//
//  Created by Jatin on 04/09/21.
//

import Foundation

// MARK: - Welcome
struct UserPostsDataModel: Codable {
    let data: [Datum]
    let total, page, limit: Int
}

// MARK: - Datum
struct Datum: Codable {
    let id: String
    let image: String
    let likes: Int
    let tags: [String]
    let text, publishDate: String
    let owner: Owner
}

// MARK: - Owner
struct Owner: Codable {
    let id, title, firstName, lastName: String
    let picture: String
}
