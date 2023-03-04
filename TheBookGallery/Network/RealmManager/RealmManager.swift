//
//  RealmManager.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 3/4/23.
//

import Foundation
import RealmSwift

protocol RealmManagerProtocol: AnyObject {
    func addFavorite(_ favorite: FavoritesModel)
    func removeFavorite(_ favorite: FavoritesModel)
    func getFavorites() -> Results<FavoritesModel>
}

final class RealmManager: RealmManagerProtocol {
    
    static let shared = RealmManager()
    let realm = try! Realm()
    
    private init() {}
    
    func addFavorite(_ favorite: FavoritesModel) {
        try! realm.write {realm.add(favorite)}
    }
    func removeFavorite(_ favorite: FavoritesModel) {
        try! realm.write {realm.delete(favorite)}
    }
    func getFavorites() -> Results<FavoritesModel> {
        return realm.objects(FavoritesModel.self)
    }
}
