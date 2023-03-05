//
//  FavoritesBuilder.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 3/3/23.
//

import Foundation

final class FavoritesBuilder {
    
    static func make() -> FavoritesViewController {
        let vc = FavoritesViewController()
        let interactor = FavoritesInteractor()
        let presenter = FavoritesPresenter(view: vc, interactor: interactor)
        interactor.delegate = presenter
        vc.presenter = presenter
        return vc
    }
}
