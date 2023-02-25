//
//  HomeContracts.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/5/23.
//

import Foundation

// Interactor
protocol BookListInteractorProtocol: AnyObject {
    var delegate: BookListInteractorDelegate? { get set }
    func load()
    func selectBook(at index: Int)
}
enum BookListInteractorOutPut {
        case setLoading(Bool)
        case showBookList([BooksResult])
        case showBookDetail(BooksResult)
}
protocol BookListInteractorDelegate: AnyObject {
    func handleOutput(_ output: BookListInteractorOutPut)
}

// Presenter
protocol HomeListPresenterProtocol: AnyObject {
    func load()
    func selectBook(at index: Int)
}
enum HomePresenterOutput {
    case updateTitle(String)
    case setLoading(Bool)
    case showBookList([HomePresentation])
}

// View
protocol HomeListViewProtocol: AnyObject {
    func handleOutput(_ output: HomePresenterOutput)
}

// Router
enum BookListRoute {
    case detail(BooksResult)
}
protocol BookListRouterProtocol: AnyObject {
    func navigate(to route: BookListRoute)
}

