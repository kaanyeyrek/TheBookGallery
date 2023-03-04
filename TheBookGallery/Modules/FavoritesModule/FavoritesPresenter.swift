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
    }
}
extension FavoritesPresenter: FavoritesListInteractorDelegate {
    func handleOutput(_ output: FavoritesInteractorOutput) {
        
    }
    
    
}
