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
    func removeFavorite<T: Object>(_ object: T)
    func getFavorites<T: Object>(_ type: T.Type) -> Results<T>
}

final class RealmManager: RealmManagerProtocol {
    
    let realm = try! Realm()
    
    func addFavorite<T: Object>(_ object: T) {
        try! realm.write {realm.add(object)}
    }
    func removeFavorite<T: Object>(_ object: T) {
        try! realm.write {realm.delete(object)}
    }
    func getFavorites<T: Object>(_ type: T.Type) -> Results<T> {
        return realm.objects(type)
    }
}
