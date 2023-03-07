//
//  FavoritesPresentation.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 3/7/23.
//

import UIKit

final class FavoritesPresentation {
    
    let id: Int
    let title: String
    let imageURL: String?
    let linkURL: String
    let authors: [String]
    let subjects: [String]
    let authorBirthYears: [Int]
    let authorDeathYears: [Int]
       
    init(book: FavoritesModel) {
        self.id = book.id
        self.title = book.title
        self.imageURL = book.image ?? ""
        self.linkURL = book.linkURL
        self.authors = Array(book.author)
        self.subjects = Array(book.subjects)
        self.authorBirthYears = Array(book.authorBirthYear)
        self.authorDeathYears = Array(book.authorDeathYear)
    }
}
