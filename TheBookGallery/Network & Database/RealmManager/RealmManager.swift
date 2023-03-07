//
//  RealmManager.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 3/4/23.
//

import Foundation
import RealmSwift

protocol RealmManagerProtocol: AnyObject {
    func addFavorite<T: Object>(_ object: T)
    func removeFavorite<T: Object>(_ type: T.Type, id: Int)
    func getFavorites<T: Object>(_ type: T.Type) -> Results<T>
    func deleteAllFavorites<T: Object>(_ type: T.Type)
}

final class RealmManager: RealmManagerProtocol {
    
    private let realm = try! Realm()
    
    func addFavorite<T: Object>(_ object: T) {
        try! realm.write {realm.add(object)}
    }
    func removeFavorite<T: Object>(_ type: T.Type, id: Int) {
        guard let objectToDelete = realm.object(ofType: type, forPrimaryKey: id) else { return }
        try! realm.write {realm.delete(objectToDelete)}
    }
    func getFavorites<T: Object>(_ type: T.Type) -> Results<T> {
        return realm.objects(type)
    }
    func deleteAllFavorites<T: Object>(_ type: T.Type) {
        let objectsToDelete = realm.objects(type)
        try! realm.write {realm.delete(objectsToDelete)}
    }
}
