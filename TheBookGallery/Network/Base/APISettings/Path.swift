//
//  Path.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/4/23.
//

import Foundation

enum Path: String {
    case popularBooks = "/books/?popular"
    case topicBooks = "/books/"
    case start1900End1999 = "/books/?author_year_start=1900&author_year_end=1999"
    case start1800End1899 = "/books/?author_year_start=1800&author_year_end=1899"
    case start1700End1799 = "/books/?author_year_start=1700&author_year_end=1799"
    case start1600End1699 = "https://gutendex.com/books/?author_year_start=1600&author_year_end=1699"
}
