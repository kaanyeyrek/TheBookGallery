//
//  BookDetailPresenter.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/25/23.
//

import Foundation

final class BookDetailPresenter: BookDetailPresenterProtocol {
    
    weak var view: BookDetailViewProtocol?
    private let book: BooksResult
    
    init(view: BookDetailViewProtocol, book: BooksResult) {
        self.view = view
        self.book = book
    }
    
    func load() {
        view?.update(HomePresentation(book: book))
    }
    func readEBookTappedButton() {
        view?.handleOutput(output: .readEBooktoSafari(with: book.formats.textPlain ?? ""))
    }
 
}
