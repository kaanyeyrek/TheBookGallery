//
//  ViewController.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/3/23.
//

import UIKit

final class HomeViewController: UIViewController {
//MARK: - UI Injection
//MARK: - UI Elements
    private var collection: UICollectionView!
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    private let sixTeenHundredsLabel = TBGLabel(radius: 20, setBackgroundColor: UIColor(hex: Color.skin), setText: "1600's", setTextColor: .systemBrown, size: 15, setAlignment: .center)
    private let sevenTeenHundredsLabel = TBGLabel(radius: 20, setBackgroundColor: UIColor(hex: Color.skin), setText: "1700's", setTextColor: .systemBrown, size: 15, setAlignment: .center)
    private let eightTeenHundredsLabel = TBGLabel(radius: 20, setBackgroundColor: UIColor(hex: Color.skin), setText: "1800's", setTextColor: .systemBrown, size: 15, setAlignment: .center)
    private let nineTeenHundredsLabel = TBGLabel(radius: 20, setBackgroundColor: UIColor(hex: Color.skin), setText: "1900's", setTextColor: .systemBrown, size: 15, setAlignment: .center)
//MARK: - LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    func setUI() {
        view.backgroundColor = .systemBackground
    }
    func setNavigationTitleFeatures() {
        title = "Gallery"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    func setSubviews() {
        [indicator, sixTeenHundredsLabel, sevenTeenHundredsLabel, eightTeenHundredsLabel, nineTeenHundredsLabel].forEach { elements in
            view.addSubview(elements)
        }
    }
    func setLayout() {
        collection.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.width, height: view.frame.height - 220))
        
        indicator.centerInSuperView(size: .init(width: 300, height: 300))
        indicator.startAnimating()
        
        sixTeenHundredsLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: collection.topAnchor, trailing: nil, padding: .init(top: 0, left: 20, bottom: 15, right: 0), size: .init(width: 80, height: 45))
        
        sevenTeenHundredsLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: collection.topAnchor, trailing: nil, padding: .init(top: 0, left: 120, bottom: 15, right: 0), size: .init(width: 80, height: 45))
        
        eightTeenHundredsLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: collection.topAnchor, trailing: nil, padding: .init(top: 0, left: 220, bottom: 15, right: 0), size: .init(width: 80, height: 45))
        
        nineTeenHundredsLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: collection.topAnchor, trailing: nil, padding: .init(top: 0, left: 320, bottom: 15, right: 0), size: .init(width: 80, height: 45))
    }
    func setCollection() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collection = collection else { return }
        collection.showsVerticalScrollIndicator = false
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.dataSource = self
        collection.delegate = self
        view.addSubview(collection)
    }
    func changeLoading(isBool: Bool) {
        isBool ? indicator.startAnimating() : indicator.stopAnimating()
    }
}
//MARK: - UICollectionViewDataSource Methods
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemGroupedBackground
        cell.layer.cornerRadius = 90
        return cell
    }
}
//MARK: - UICollectionViewDelegate Methods
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collection.deselectItem(at: indexPath, animated: true)
    }
}
//MARK: - UICollectionViewDelegateFlowLayout Mrthods
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (view.frame.width - 10) / 2
        return .init(width: width - 30, height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 20, bottom: 20, right: 20)
    }
}

