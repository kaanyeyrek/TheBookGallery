//
//  HomePresentation.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/23/23.
//

import UIKit

final class HomePresentation {
    let title: String
    let imageURL: String?
    let subjects: [String]
    let authorName: [String]
    let authorBirthYear: [Int]
    let authorDeathYear: [Int]
    
    init(book: BooksResult) {
        self.title = book.title
        self.imageURL = book.formats.imageJpeg
        self.subjects = book.subjects
        self.authorName = book.authors.map {$0.name}
        self.authorBirthYear = book.authors.map {$0.birth_year ?? 0}
        self.authorDeathYear = book.authors.map {$0.death_year ?? 0}
    }
}
