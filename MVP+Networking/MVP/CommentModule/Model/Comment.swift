//
//  Comment.swift
//  MVP
//
//  Created by Roman Bigun on 04.03.2021.
//

import Foundation

struct Comment: Codable {
    let postID, id: Int
    let name, email, body: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}
typealias Comments = [Comment]
