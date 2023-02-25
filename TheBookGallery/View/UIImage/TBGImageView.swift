//
//  TBGImageView.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/4/23.
//

import UIKit

class TBGImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    convenience init(radius: CGFloat?, setImage: UIImage?) {
        self.init(frame: .zero)
        layer.cornerRadius = radius ?? 0
        image = setImage
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        clipsToBounds = true
        layer.masksToBounds = true
        contentMode = .scaleAspectFit
    }
    
}
