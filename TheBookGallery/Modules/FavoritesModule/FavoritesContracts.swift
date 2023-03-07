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
    func didTappedThrash()
}
enum FavoritesInteractorOutput {
    case showFavoritesList([FavoritesModel])
    case showUpdateFavoritesList([FavoritesModel])
}
protocol  FavoritesListInteractorDelegate: AnyObject {
    func handleOutput(_ output: FavoritesInteractorOutput)
}
//MARK: - Presenter
protocol FavoritesPresenterProtocol: AnyObject {
    func load()
    func didTappedTrash()
}
enum FavoritesPresenterOutput {
    case updateTitle(String)
    case showFavoritesList([FavoritesPresentation])
    case showUpdateFavoritesList([FavoritesPresentation])
}
//MARK: - View
protocol FavoritesViewProtocol: AnyObject {
    func handleOutput(_ output: FavoritesPresenterOutput)
}


