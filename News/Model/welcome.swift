//
//  welcome.swift
//  News
//
//  Created by Arshif on 11/01/2024.
//

import Foundation
struct Welcome: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}


