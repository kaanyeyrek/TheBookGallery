//
//  HomePresenter.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/23/23.
//

import Foundation


final class BookListPresenter: HomeListPresenterProtocol {
    
    private weak var view: HomeListViewProtocol?
    private let interactor: BookListInteractorProtocol
    private let router: BookListRouterProtocol
    
    init(view: HomeListViewProtocol, interactor: BookListInteractorProtocol, router: BookListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
  
    func load() {
        view?.handleOutput(.updateTitle("Book Gallery"))
        interactor.load()
    }
    func selectBook(at index: Int) {
        interactor.selectBook(at: index)
    }
}

extension BookListPresenter: BookListInteractorDelegate {
    
    func handleOutput(_ output: BookListInteractorOutPut) {
        switch output {
        case .setLoading(let isLoading):
            view?.handleOutput(.setLoading(isLoading))
        case .showBookList(let books):
            let bookPresentations = books.map {HomePresentation(book: $0)}
            view?.handleOutput(.showBookList(bookPresentations))
        case .showBookDetail(let book):
            router.navigate(to: .detail(book))
        }
    }
}
