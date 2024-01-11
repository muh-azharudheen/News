//
//  article.swift
//  News
//
//  Created by Arshif on 11/01/2024.
//

import Foundation
struct Article: Codable {
    let source: [Source]
    let author: String?
    let title, description: String
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String
}



