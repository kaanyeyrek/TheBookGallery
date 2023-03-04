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
    func tapped1600s()
    func tapped1700s()
    func tapped1800s()
    func tapped1900s()
    func showFavoritesVC()
}
enum BookListInteractorOutPut {
        case setLoading(Bool)
        case showBookList([BooksResult])
        case showBookDetail(BooksResult)
        case show1600s([BooksResult])
        case show1700s([BooksResult])
        case show1800s([BooksResult])
        case show1900s([BooksResult])
        case showFavoritesVC
            
}
protocol BookListInteractorDelegate: AnyObject {
    func handleOutput(_ output: BookListInteractorOutPut)
}

// Presenter
protocol HomeListPresenterProtocol: AnyObject {
    func load()
    func selectBook(at index: Int)
    func tapped1600s()
    func tapped1700s()
    func tapped1800s()
    func tapped1900s()
    func tappedFavoritesButton()
}
enum HomePresenterOutput {
    case updateTitle(String)
    case setLoading(Bool)
    case showBookList([HomePresentation])
    case show1600s([HomePresentation])
    case show1700s([HomePresentation])
    case show1800s([HomePresentation])
    case show1900s([HomePresentation])
}

// View
protocol HomeListViewProtocol: AnyObject {
    func handleOutput(_ output: HomePresenterOutput)
}

// Router
enum BookListRoute {
    case detail(BooksResult)
    case favorites
}
protocol BookListRouterProtocol: AnyObject {
    func navigate(to route: BookListRoute)
}

