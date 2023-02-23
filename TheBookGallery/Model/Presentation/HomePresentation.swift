//
//  HomePresentation.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/23/23.
//

import UIKit

struct HomePresentation {
    let title: String
    let imageURL: String
    
    init(model: BooksResult) {
        self.title = model.title
        self.imageURL = model.formats.imageJPEG
    }
}
