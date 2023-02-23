//
//  AppRouter.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/23/23.
//

import UIKit

final class AppRouter {
    
    let window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .orange
        viewController.title = "The Book Gallery"
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}
