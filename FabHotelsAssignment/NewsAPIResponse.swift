//
//  NewsAPIResponse.swift
//  FabHotelsAssignment
//
//  Created by Shivi Agarwal on 15/11/21.
//

import Foundation

struct NewsAPIResponse: Decodable {
    let status: String
    let articles: [Articles]
    let totalResults: Int
    
}

struct Articles: Decodable {
    let source: Source
    let title: String
    let content: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
    
}

struct Source: Codable {
    let name: String
}
