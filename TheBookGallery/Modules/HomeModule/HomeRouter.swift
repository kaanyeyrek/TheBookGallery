//
//  HomeRouter.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/23/23.
//

import UIKit
 
final class HomeListRouter: BookListRouterProtocol {
    
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: BookListRoute) {
        switch route {
        case .detail(let book):
            let detailView = BookDetailBuilder.make(with: book)
            view.show(detailView, sender: nil)
        }
    }
}
