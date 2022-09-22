//
//  PostModel.swift
//  PostKlix
//
//  Created by Anang Nugraha on 21/09/22.
//

import Foundation

// MARK: - PostModelElement
struct PostModel: Codable {
    var id: Int?
    var title: String?
    var content: String?
    var publishedAt: String?
    var createdAt: String?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case content = "content"
        case publishedAt = "published_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

typealias PostModelList = [PostModel]
