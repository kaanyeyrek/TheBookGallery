//
//  HomeContracts.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/5/23.
//

import Foundation

// Interactor
protocol MovieListInteractorProtocol: AnyObject {
    func load()
    func selectBook(at index: Int)
}
enum MovieListInteractorOutPut {
        case setLoading(Bool)
        case showBookList([Books])
        case showBookDetail(Books)
}
protocol BookListInteractorDelegate: AnyObject {
    
}

// Presenter
protocol HomeListPresenterProtocol: AnyObject {
    var view: HomeListViewProtocol { get set }
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

