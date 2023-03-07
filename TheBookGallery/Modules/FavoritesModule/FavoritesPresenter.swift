//
//  FavoritesPresenter.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 3/3/23.
//

import Foundation

final class FavoritesPresenter: FavoritesPresenterProtocol {
    
    private weak var view: FavoritesViewProtocol?
    private var interactor: FavoritesInteractorProtocol
    
    init(view: FavoritesViewProtocol, interactor: FavoritesInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }
    
    func load() {
        interactor.load()
        view?.handleOutput(.updateTitle("Favorite Books"))
    }
    func didTappedTrash() {
        interactor.didTappedThrash()
    }
}
extension FavoritesPresenter: FavoritesListInteractorDelegate {
    func handleOutput(_ output: FavoritesInteractorOutput) {
        switch output {
        case .showFavoritesList(let favorites):
            let favoritePresentation = favorites.map {FavoritesPresentation(book: $0)}
            view?.handleOutput(.showFavoritesList(favoritePresentation))
        case .showUpdateFavoritesList(let favorites):
            let favoritePresentation = favorites.map {FavoritesPresentation(book: $0)}
            view?.handleOutput(.showUpdateFavoritesList(favoritePresentation))
        }
    }
}
