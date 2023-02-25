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
    
    init(book: BooksResult) {
        self.title = book.title
        self.imageURL = book.formats.imageJpeg
    }
}
