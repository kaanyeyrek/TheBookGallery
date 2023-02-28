//
//  BookDetailContracts.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/25/23.
//

import Foundation

// Detail Presenter Output, Input
enum BookDetailPresenterOutput {
    case readEBooktoSafari(with: String)
}

protocol BookDetailPresenterProtocol: AnyObject {
    func load()
    func readEBookTappedButton()
}

// Detail View Input
protocol BookDetailViewProtocol: AnyObject {
    func update(_ presentation: HomePresentation)
    func handleOutput(output: BookDetailPresenterOutput)
}

