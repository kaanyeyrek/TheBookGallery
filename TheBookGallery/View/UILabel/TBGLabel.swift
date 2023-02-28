//
//  TBGLabel.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/4/23.
//

import UIKit

class TBGLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    convenience init(radius: CGFloat?, setBackgroundColor: UIColor?, setText: String?, setTextColor: UIColor?, size: CGFloat?, setAlignment: NSTextAlignment?) {
        self.init(frame: .zero)
        layer.cornerRadius = radius ?? 0
        backgroundColor = setBackgroundColor
        text = setText
        textColor = setTextColor
        font = .systemFont(ofSize: size!, weight: .bold)
        textAlignment = setAlignment!
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        layer.masksToBounds = true
        clipsToBounds = true
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
    }

}
