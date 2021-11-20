//
//  NewsArticleModel.swift
//  FabHotelsAssignment
//
//  Created by Shivi Agarwal on 15/11/21.
//

import Foundation

class NewsArticle
{
    let title: String
    let subtitle: String?
    let imageURL: URL?
    //var imageData: Data? = nil
    
    init(title: String, subtitle: String, imageURL: URL?)
    {
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL
    }
    
}
