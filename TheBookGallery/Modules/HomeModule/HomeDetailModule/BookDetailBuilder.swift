//
//  BookDetailBuilder.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/25/23.
//

import Foundation

final class BookDetailBuilder {
    
    static func make(with book: BooksResult) -> BookDetailViewController {
        let vc = BookDetailViewController()
        let interactor = BookDetailInteractor(realmManager: app.realmService)
        let presenter = BookDetailPresenter(view: vc, book: book, interactor: interactor)
        interactor.delegate = presenter
        vc.presenter = presenter
        return vc
    }
}
