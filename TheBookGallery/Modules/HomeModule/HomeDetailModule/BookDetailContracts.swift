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
    case checkFavoriteValue(Bool)
}

protocol BookDetailPresenterProtocol: AnyObject {
    func load()
    func readEBookTappedButton()
    func didTappedFavoritesButton(isSelected: Bool)
}

// Detail View Input
protocol BookDetailViewProtocol: AnyObject {
    func update(_ presentation: HomePresentation)
    func handleOutput(output: BookDetailPresenterOutput)
}

// Interactor
protocol BookDetailInteractorProtocol: AnyObject {
    var delegate: BookDetailInteractorDelegate? { get set }
    func load()
    func checkIfFavorited(book: BooksResult)
    func saveFavorites()
    func deleteFavorites()
}
enum BookDetailInteractorOutput {
    case checkFavoriteValue(Bool)
}
protocol BookDetailInteractorDelegate: AnyObject {
    func handleOutput(_ output: BookDetailInteractorOutput)
}
