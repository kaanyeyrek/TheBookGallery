//
//  FavoritesInteractor.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 3/3/23.
//

import Foundation

final class FavoritesInteractor: FavoritesInteractorProtocol {
    
    weak var delegate: FavoritesListInteractorDelegate?
    private var realmManager: RealmManagerProtocol
    private var favoritesModel: [FavoritesModel] = []
    
    init(realmManager: RealmManagerProtocol = RealmManager()) {
        self.realmManager = realmManager
    }
    
    func load() {
        favoritesModel = Array(realmManager.getFavorites(FavoritesModel.self))
        delegate?.handleOutput(.showFavoritesList(favoritesModel))
    }
    func didTappedThrash() {
        realmManager.deleteAllFavorites(FavoritesModel.self)
        let updateFavorites = Array(realmManager.getFavorites(FavoritesModel.self))
        delegate?.handleOutput(.showUpdateFavoritesList(updateFavorites))
    }
}
