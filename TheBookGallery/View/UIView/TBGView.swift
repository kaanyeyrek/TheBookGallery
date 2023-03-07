//
//  TBGView.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/4/23.
//

import UIKit

class TBGView: UIView {
// empty View
    let headerLabel = TBGLabel(radius: 0, setBackgroundColor: .clear, setText: nil, setTextColor: .lightGray, size: 20, setAlignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    convenience init(message: String) {
        self.init(frame: .zero)
        headerLabel.text = message
    }
    private func configure() {
        self.backgroundColor = UIColor(hex: Color.skin)
        addSubview(headerLabel)
        headerLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 10), size: .init(width: 236, height: 41))
        headerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -50).isActive = true
    }
}
