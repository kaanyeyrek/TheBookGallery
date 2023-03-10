//
//  HomeListBuilder.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/25/23.
//

import Foundation

final class HomeListBuilder {
    
    static func make() -> HomeViewController {
        let vc = HomeViewController()
        let router = HomeListRouter(view: vc)
        let interactor = HomeListInteractor(service: app.service)
        let presenter = BookListPresenter(view: vc, interactor: interactor, router: router)
        interactor.delegate = presenter
        vc.presenter = presenter
        return vc
    }
}
