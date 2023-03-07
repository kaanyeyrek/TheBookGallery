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
    private var favoritePresentation: [FavoritesPresentation] = [] {
        didSet {
            collection.reloadData()
            
            if favoritePresentation.isEmpty {
                showEmptyStateView(with: "You do not have a favorite item.", at: self.view)
                navigationItem.rightBarButtonItem?.isEnabled = false
            } else {
                removeEmptyStateView()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
        setUI()
        setNavigationTitleFeatures()
        setCollection()
        setNavigationBarItem()
    }
    private func setUI() {
        view.backgroundColor = UIColor(hex: Color.skin)
    }
    private func setNavigationTitleFeatures() {
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    private func setNavigationBarItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: SystemImage.trash), style: .done, target: self, action: #selector(didTappedTrashButton))
    }
    private func setCollection() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collection = collection else { return }
        collection.showsVerticalScrollIndicator = false
        collection.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: ReuseIdentifier.homeCollection)
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = UIColor(hex: Color.skin)
        view.addSubview(collection)
        collection.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, size: .init(width: view.frame.width, height: view.frame.height))
    }
    //MARK: - @objc actions
    @objc private func didTappedTrashButton() {
        self.showAlertWithConfirmation(title: "You are about to delete!", message: "Do you want to continue?") {
            self.presenter.didTappedTrash()
        }
    }
}
extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        favoritePresentation.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.homeCollection, for: indexPath) as? HomeCollectionViewCell else {return UICollectionViewCell()}
        let model = favoritePresentation[indexPath.item]
        cell.setFavoritesBookImage(model: model)
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
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .showFavoritesList(let favoriteList):
            DispatchQueue.main.async {
                self.favoritePresentation = favoriteList
                self.collection.reloadData()
            }
        case .showUpdateFavoritesList(let favoriteList):
            DispatchQueue.main.async {
                self.favoritePresentation = favoriteList
                self.collection.reloadData()
            }
        }
    }
}
