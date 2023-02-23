//
//  TBGButton.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/4/23.
//

import UIKit

class TBGButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    convenience init(radius: CGFloat?, setBackgroundColor: UIColor?, title: String?, titleColor: UIColor?, size: CGFloat) {
        self.init(frame: .zero)
        layer.cornerRadius = radius ?? 0
        backgroundColor = setBackgroundColor
        setTitleColor(titleColor, for: .normal)
        setTitle(title, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: size)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        layer.masksToBounds = true
        clipsToBounds = true
    }
}
