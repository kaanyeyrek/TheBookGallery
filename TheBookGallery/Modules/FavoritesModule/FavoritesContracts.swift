//
//  FavoritesContracts.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 3/3/23.
//

import Foundation

//MARK: - Interactor
protocol FavoritesInteractorProtocol: AnyObject {
    var delegate: FavoritesListInteractorDelegate? { get set }
    func load()
}
enum FavoritesInteractorOutput {
    case setLoading(Bool)
    case showFavoritesList
    
}
protocol  FavoritesListInteractorDelegate: AnyObject {
    func handleOutput(_ output: FavoritesInteractorOutput)
}
//MARK: - Presenter
protocol FavoritesPresenterProtocol: AnyObject {
    func load()
    
}
enum FavoritesPresenterOutput {
    case setLoading(Bool)
    case updateTitle
    case showFavoritesList
}
//MARK: - View
protocol FavoritesViewProtocol: AnyObject {
    func handleOutput(_ output: FavoritesPresenterOutput)
}


