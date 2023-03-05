//
//  BookDetailInteractor.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 3/4/23.
//

import Foundation
import RealmSwift

final class BookDetailInteractor: BookDetailInteractorProtocol {
    
    weak var delegate: BookDetailInteractorDelegate?
    private var realmManager: RealmManagerProtocol
    
    init(realmManager: RealmManagerProtocol = RealmManager()) {
        self.realmManager = realmManager
    }
    
    func load() {
        
    }
    // helper status
    func checkIfFavorited(book: BooksResult) {
        let favorites = Array(realmManager.getFavorites(FavoritesModel.self))
        let isFavorited = favorites.contains(where: {$0.title == book.title})
        delegate?.handleOutput(.checkFavoriteValue(isFavorited))
    }
    func saveFavorites() {
        
    }
    func deleteFavorites() {
        
    }
}
