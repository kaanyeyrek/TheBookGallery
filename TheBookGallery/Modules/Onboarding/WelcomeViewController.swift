//
//  WelcomeViewController.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/4/23.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let logoImage = TBGImageView(radius: nil, setImage: UIImage(named: Constants.logoImage))
    private let welcomePhotoImage = TBGImageView(radius: 90, setImage: UIImage(named: Constants.welcomePhoto))
    private let visitGalleryButton = TBGButton(radius: 30, setBackgroundColor: UIColor(hex: Color.darkGray), title: "VISIT GALLERY", titleColor: .white, size: 18)
    private let descriptionLabel = TBGLabel(radius: nil, setBackgroundColor: .clear, setText: "Discover your favorite books!", setTextColor: UIColor(hex: Color.darkGray), size: 20, setAlignment: .center)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubviews()
        layout()
        addTargets()
    }
    private func addSubviews() {
        [logoImage, welcomePhotoImage, visitGalleryButton, descriptionLabel].forEach { elements in
            view.addSubview(elements)
        }
    }
    private func layout() {
        logoImage.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: .init(width: 100, height: 200))
        logoImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -300).isActive = true
        
        welcomePhotoImage.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, size: .init(width: 200, height: 400))
        welcomePhotoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        welcomePhotoImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30).isActive = true
        
        visitGalleryButton.anchor(top: nil, leading: nil, bottom: view.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 50, right: 0), size: .init(width: 180, height: 60))
        visitGalleryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        descriptionLabel.anchor(top: welcomePhotoImage.bottomAnchor, leading: view.leadingAnchor, bottom: visitGalleryButton.topAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 35, right: 0), size: .init(width: 50, height: 50))
    }
    private func addTargets() {
        visitGalleryButton.addTarget(self, action: #selector(didTappedVisitGalleryButton), for: .touchUpInside)
    }
    @objc private func didTappedVisitGalleryButton() {
        dismiss(animated: true)
        CheckFirstLoginMethod.shared.setIsNotNewUser()
    }
}
