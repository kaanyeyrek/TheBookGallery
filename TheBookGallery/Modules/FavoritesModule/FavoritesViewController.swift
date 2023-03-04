//
//  FavoritesViewController.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 3/3/23.
//

import UIKit

final class FavoritesViewController: UIViewController {
    
    var presenter: FavoritesPresenterProtocol!
    
    private var collection: UICollectionView!
    private var indicator: UIActivityIndicatorView = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
        setUI()
        setNavigationTitleFeatures()
        setSubviews()
        setLayout()
        setCollection()
    }
    private func setUI() {
        view.backgroundColor = UIColor(hex: Color.skin)
    }
    private func setNavigationTitleFeatures() {
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Book Favorites"
    }
    private func setSubviews() {
        [indicator].forEach { elements in
            view.addSubview(elements)
        }
    }
    private func setLayout() {
        indicator.centerInSuperView(size: .init(width: 300, height: 300))
        indicator.startAnimating()
    }
    private func setCollection() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collection = collection else { return }
        collection.showsVerticalScrollIndicator = false
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.dataSource = self
        collection.delegate = self
        view.addSubview(collection)
        collection.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, size: .init(width: view.frame.width, height: view.frame.height-170))
    }
}
extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}
extension FavoritesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
extension FavoritesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (view.frame.width - 10) / 2
        return .init(width: width - 30, height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 20, left: 20, bottom: 20, right: 20)
    }
}
extension FavoritesViewController: FavoritesViewProtocol {
    func handleOutput(_ output: FavoritesPresenterOutput) {
        
    }
}
