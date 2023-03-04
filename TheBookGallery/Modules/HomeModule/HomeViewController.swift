//
//  ViewController.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/3/23.
//

import UIKit

final class HomeViewController: UIViewController {
//MARK: - UI Elements
    private var collection: UICollectionView!
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    private let sixTeenHundredsButton = TBGButton(radius: 20, setBackgroundColor: .white, title: "1600's", titleColor: .systemBrown, size: 15)
    private let sevenTeenHundreButton = TBGButton(radius: 20, setBackgroundColor: .white, title: "1700's", titleColor: .systemBrown, size: 15)
    private let eightTeenHundreButton = TBGButton(radius: 20, setBackgroundColor: .white, title: "1800's", titleColor: .systemBrown, size: 15)
    private let nineTeenHundredButton = TBGButton(radius: 20, setBackgroundColor: .white, title: "1900's", titleColor: .systemBrown, size: 15)
    private let favoritesButton = TBGButton(radius: 10, setBackgroundColor: UIColor(hex: Color.skin), title: nil, titleColor: nil, size: 15)
    
    var presenter: HomeListPresenterProtocol!
    private var books: [HomePresentation] = []
//MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
        setSubviews()
        setCollection()
        setLayout()
        setUI()
        setNavigationTitleFeatures()
        setTargets()
        setNavBarFeatures()
    }
    private func setUI() {
        view.backgroundColor = UIColor(hex: Color.skin)
    }
    private func setNavigationTitleFeatures() {
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    private func setSubviews() {
        [indicator, sixTeenHundredsButton, sevenTeenHundreButton, eightTeenHundreButton, nineTeenHundredButton].forEach { elements in
            view.addSubview(elements)
        }
    }
    private func setTargets() {
        sixTeenHundredsButton.addTarget(self, action: #selector(didTapped1600s), for: .touchUpInside)
        sevenTeenHundreButton.addTarget(self, action: #selector(didTapped1700s), for: .touchUpInside)
        eightTeenHundreButton.addTarget(self, action: #selector(didTapped1800s), for: .touchUpInside)
        nineTeenHundredButton.addTarget(self, action: #selector(didTapped1900s), for: .touchUpInside)
        favoritesButton.addTarget(self, action: #selector(didTappedFavorites), for: .touchUpInside)
    }
    private func setNavBarFeatures() {
        favoritesButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        favoritesButton.setBackgroundImage(UIImage(systemName: SystemImage.favoritesIcon), for: .normal)
        favoritesButton.tintColor = UIColor(hex: Color.pink)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: favoritesButton)
    }
    private func setLayout() {
        indicator.centerInSuperView(size: .init(width: 300, height: 300))
        indicator.startAnimating()
        
        sixTeenHundredsButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: collection.topAnchor, trailing: nil, padding: .init(top: 0, left: 25, bottom: 15, right: 0), size: .init(width: 80, height: 45))
        
        sevenTeenHundreButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: collection.topAnchor, trailing: nil, padding: .init(top: 0, left: 125, bottom: 15, right: 0), size: .init(width: 80, height: 45))
        
        eightTeenHundreButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: collection.topAnchor, trailing: nil, padding: .init(top: 0, left: 225, bottom: 15, right: 0), size: .init(width: 80, height: 45))
        
        nineTeenHundredButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: collection.topAnchor, trailing: nil, padding: .init(top: 0, left: 325, bottom: 15, right: 0), size: .init(width: 80, height: 45))
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
        view.addSubview(collection)
        collection.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, size: .init(width: view.frame.width, height: view.frame.height-230))
    }
//MARK: - @objc actions
    @objc private func didTapped1600s() {
        presenter.tapped1600s()
        collection.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
    }
    @objc private func didTapped1700s() {
        presenter.tapped1700s()
        collection.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
    }
    @objc private func didTapped1800s() {
        presenter.tapped1800s()
        collection.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
    }
    @objc private func didTapped1900s() {
        presenter.tapped1900s()
        collection.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
    }
    @objc private func didTappedFavorites() {
        presenter.tappedFavoritesButton()
    }
}
//MARK: - UICollectionViewDataSource Methods
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        books.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.homeCollection, for: indexPath) as? HomeCollectionViewCell else { return
            UICollectionViewCell()
        }
        let model = books[indexPath.item]
        cell.setBookImage(model: model)
        return cell
    }
}
//MARK: - UICollectionViewDelegate Methods
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collection.deselectItem(at: indexPath, animated: true)
        presenter.selectBook(at: indexPath.item)
    }
}
//MARK: - UICollectionViewDelegateFlowLayout Methods
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (view.frame.width - 10) / 2
        return .init(width: width - 30, height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 20, left: 20, bottom: 20, right: 20)
    }
}
//MARK: - HomeListView Interface
extension HomeViewController: HomeListViewProtocol {
    func handleOutput(_ output: HomePresenterOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .setLoading(let isLoading):
            DispatchQueue.main.async {
                if isLoading {
                    self.indicator.startAnimating()
                } else {
                    self.indicator.stopAnimating()
                }
            }
        case .showBookList(let books):
            DispatchQueue.main.async {
                self.books = books
                self.collection.reloadData()
            }
        case .show1600s(let books):
            DispatchQueue.main.async {
                self.books = books
                self.collection.reloadData()
            }
        case .show1700s(let books):
            DispatchQueue.main.async {
                self.books = books
                self.collection.reloadData()
            }
        case .show1800s(let books):
            DispatchQueue.main.async {
                self.books = books
                self.collection.reloadData()
            }
        case .show1900s(let books):
            DispatchQueue.main.async {
                self.books = books
                self.collection.reloadData()
            }
        }
    }
}

