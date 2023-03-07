//
//  HomeCollectionViewCell.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/25/23.
//

import UIKit
import SDWebImage

class HomeCollectionViewCell: UICollectionViewCell {
    
    private let bookImage = TBGImageView(radius: 10, setImage: nil)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        bookImage.image = nil
    }
    private func setSubviews() {
        [bookImage].forEach { elements in
            self.addSubview(elements)
        }
    }
    private func setLayout() {
        bookImage.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, size: .init(width: self.frame.width, height: self.frame.height))
    }
    func setBookImage(model: HomePresentation) {
        if let imageURL = model.imageURL {
            bookImage.sd_imageIndicator = SDWebImageActivityIndicator.medium
            bookImage.sd_imageTransition = .fade
            bookImage.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(systemName: SystemImage.placeHolder))
        }
    }
    func setFavoritesBookImage(model: FavoritesPresentation) {
        if let imageURL = model.imageURL {
            bookImage.sd_imageIndicator = SDWebImageActivityIndicator.medium
            bookImage.sd_imageTransition = .fade
            bookImage.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(systemName: SystemImage.placeHolder))
        }
    }
}
