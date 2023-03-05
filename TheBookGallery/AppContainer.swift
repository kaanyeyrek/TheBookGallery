//
//  AppContainer.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/23/23.
//

import Foundation

let app = AppContainer()

final class AppContainer {
    
    let router = AppRouter()
    let service = BooksService(service: CoreService())
    let realmService = RealmManager()
    
}
