//
//  BookDetailPresenter.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/25/23.
//

import Foundation

final class BookDetailPresenter: BookDetailPresenterProtocol {
    
    private weak var view: BookDetailViewProtocol?
    private var book: BooksResult
    private let interactor: BookDetailInteractorProtocol
    
    init(view: BookDetailViewProtocol, book: BooksResult, interactor: BookDetailInteractorProtocol) {
        self.view = view
        self.book = book
        self.interactor = interactor
    }
    
    func load() {
        view?.update(HomePresentation(book: book))
        interactor.checkIfFavorited(book: book)
    }
    func readEBookTappedButton() {
        view?.handleOutput(output: .readEBooktoSafari(with: book.formats.textPlain ?? ""))
    }
    func didTappedFavoritesButton(isSelected: Bool) {
        if isSelected == true {
            interactor.deleteFavorites(book: book)
        } else {
            interactor.saveFavorites(book: book)
        }
    }
}
extension BookDetailPresenter: BookDetailInteractorDelegate {
    func handleOutput(_ output: BookDetailInteractorOutput) {
        switch output {
        case .checkFavoriteValue(let favorited):
            view?.handleOutput(output: .checkFavoriteValue(favorited))
        }
    }
}
