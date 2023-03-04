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
    func tapped1600s() {
        interactor.tapped1600s()
    }
    func tapped1700s() {
        interactor.tapped1700s()
    }
    func tapped1800s() {
        interactor.tapped1800s()
    }
    func tapped1900s() {
        interactor.tapped1900s()
    }
    func tappedFavoritesButton() {
        interactor.showFavoritesVC()
    }
}
//MARK: - BookListInteractor Interface
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
        case .show1600s(let book):
            let bookPresentation = book.map {HomePresentation(book: $0)}
            view?.handleOutput(.show1600s(bookPresentation))
        case .show1700s(let book):
            let bookPresentation = book.map {HomePresentation(book: $0)}
            view?.handleOutput(.show1700s(bookPresentation))
        case .show1800s(let book):
            let bookPresentation = book.map {HomePresentation(book: $0)}
            view?.handleOutput(.show1800s(bookPresentation))
        case .show1900s(let book):
            let bookPresentation = book.map {HomePresentation(book: $0)}
            view?.handleOutput(.show1900s(bookPresentation))
        case .showFavoritesVC:
            router.navigate(to: .favorites)
        }
    }
}
