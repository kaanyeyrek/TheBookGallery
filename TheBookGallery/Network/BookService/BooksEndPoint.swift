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
    case getStart1900End1999
    case getStart1800End1899
    case getStart1700End1799
    case getStart1600End1699

    
    var path: String {
        switch self {
        case .getPopularBooks:
            return Path.books.rawValue
        case .getTopicBooks:
            return Path.books.rawValue
        case .getStart1900End1999:
            return Path.books.rawValue
        case .getStart1800End1899:
            return Path.books.rawValue
        case .getStart1700End1799:
            return Path.books.rawValue
        case .getStart1600End1699:
            return Path.books.rawValue
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
            URLQueryItem(name: "topic", value: ""),
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: String(page))
            ]
        case .getStart1900End1999:
            return [
            URLQueryItem(name: "author_year_start", value: "1900"),
            URLQueryItem(name: "author_year_end", value: "2000"),
            URLQueryItem(name: "language", value: "en-US"),
            ]
        case .getStart1800End1899:
            return [
            URLQueryItem(name: "author_year_start", value: "1800"),
            URLQueryItem(name: "author_year_end", value: "1900"),
            URLQueryItem(name: "language", value: "en-US"),
            ]
        case .getStart1700End1799:
            return [
            URLQueryItem(name: "author_year_start", value: "1700"),
            URLQueryItem(name: "author_year_end", value: "1800"),
            URLQueryItem(name: "language", value: "en-US"),
            ]
        case .getStart1600End1699:
            return [
            URLQueryItem(name: "author_year_start", value: "1600"),
            URLQueryItem(name: "author_year_end", value: "1700"),
            URLQueryItem(name: "language", value: "en-US"),
            ]
        }
    }
}
