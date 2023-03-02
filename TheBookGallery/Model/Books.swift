//
//  Books.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/3/23.
//

import Foundation

struct Books: Decodable {
    let results: [BooksResult]
}
struct BooksResult: Decodable {
    let id: Int
    let title: String
    let authors: [Writer]
    let subjects: [String]
    let formats: Text
}
struct Writer: Decodable {
    let name: String
    let birth_year: Int?
    let death_year: Int
}
struct Text: Decodable {
    let imageJpeg: String?
    let textPlain: String?
    
    enum CodingKeys: String, CodingKey {
        case imageJpeg = "image/jpeg"
        case textPlain = "text/plain"
    }
}

