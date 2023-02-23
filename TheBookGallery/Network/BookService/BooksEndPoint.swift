//
//  NewsEndPoint.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/4/23.
//

import Foundation

enum BooksEndPoint: HTTPEndpoint {
    
    case getPopularBooks(page: Int)
    case getTopicBooks(page: Int)
    case getStart1900End1999(page: Int)
    case getStart1800End1899(page: Int)
    case getStart1700End1799(page: Int)
    case getStart1600End1699(page: Int)

    
    var path: String {
        switch self {
        case .getPopularBooks:
            return Path.popularBooks.rawValue
        case .getTopicBooks:
            return Path.topicBooks.rawValue
        case .getStart1900End1999:
            return Path.start1900End1999.rawValue
        case .getStart1800End1899:
            return Path.start1800End1899.rawValue
        case .getStart1700End1799:
            return Path.start1700End1799.rawValue
        case .getStart1600End1699:
            return Path.start1600End1699.rawValue
        }
    }
    var query: [URLQueryItem] {
        switch self {
        case .getPopularBooks(let page):
            return [
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: String(page))
            ]
        case .getTopicBooks(let page):
            return [
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: String(page))
            ]
        case .getStart1900End1999(let page):
            return [
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: String(page))
            ]
        case .getStart1800End1899(let page):
            return [
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: String(page))
            ]
        case .getStart1700End1799(let page):
            return [
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: String(page))
            ]
        case .getStart1600End1699(let page):
            return [
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: String(page))
            ]
        }
    }
}
