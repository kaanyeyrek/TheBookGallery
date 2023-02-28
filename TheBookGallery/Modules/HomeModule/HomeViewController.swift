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
    private let sixTeenHundredsLabel = TBGLabel(radius: 20, setBackgroundColor: UIColor.white, setText: "1600's", setTextColor: .systemBrown, size: 15, setAlignment: .center)
    private let sevenTeenHundredsLabel = TBGLabel(radius: 20, setBackgroundColor: UIColor.white, setText: "1700's", setTextColor: .systemBrown, size: 15, setAlignment: .center)
    private let eightTeenHundredsLabel = TBGLabel(radius: 20, setBackgroundColor: UIColor.white, setText: "1800's", setTextColor: .systemBrown, size: 15, setAlignment: .center)
    private let nineTeenHundredsLabel = TBGLabel(radius: 20, setBackgroundColor: UIColor.white, setText: "1900's", setTextColor: .systemBrown, size: 15, setAlignment: .center)
    
    var presenter: HomeListPresenterProtocol!
    private var books: [HomePresentation] = []
//MARK: - LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubviews()
        setCollection()
        setLayout()
        setUI()
        setNavigationTitleFeatures()
        presenter.load()
    }
    func setUI() {
        view.backgroundColor = UIColor(hex: Color.skin)
    }
    func setNavigationTitleFeatures() {
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    func setSubviews() {
        [indicator, sixTeenHundredsLabel, sevenTeenHundredsLabel, eightTeenHundredsLabel, nineTeenHundredsLabel].forEach { elements in
            view.addSubview(elements)
        }
    }
    func setLayout() {
        indicator.centerInSuperView(size: .init(width: 300, height: 300))
        indicator.startAnimating()
        
        sixTeenHundredsLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: collection.topAnchor, trailing: nil, padding: .init(top: 0, left: 25, bottom: 15, right: 0), size: .init(width: 80, height: 45))
        
        sevenTeenHundredsLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: collection.topAnchor, trailing: nil, padding: .init(top: 0, left: 125, bottom: 15, right: 0), size: .init(width: 80, height: 45))
        
        eightTeenHundredsLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: collection.topAnchor, trailing: nil, padding: .init(top: 0, left: 225, bottom: 15, right: 0), size: .init(width: 80, height: 45))
        
        nineTeenHundredsLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: collection.topAnchor, trailing: nil, padding: .init(top: 0, left: 325, bottom: 15, right: 0), size: .init(width: 80, height: 45))
    }
    func setCollection() {
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
        }
    }
}

