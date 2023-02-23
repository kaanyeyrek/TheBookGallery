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
    let birthYear: String
    let deathYear: String
}
struct Text: Decodable {
    let imageJPEG: String
    let textPlain: String
}

