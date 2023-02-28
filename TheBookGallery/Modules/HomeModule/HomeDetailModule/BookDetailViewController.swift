//
//  BookDetailViewController.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/25/23.
//

import UIKit
import SDWebImage
import SafariServices

class BookDetailViewController: UIViewController {
    
    var presenter: BookDetailPresenterProtocol!
    
    private let bookImage = TBGImageView(radius: 0, setImage: nil)
    private let bookTitle = TBGLabel(radius: 0, setBackgroundColor: UIColor(hex: Color.skin), setText: nil, setTextColor: .black, size: 20, setAlignment: .center)
    private let authorHeader = TBGLabel(radius: 0, setBackgroundColor: UIColor(hex: Color.skin), setText: "Author:", setTextColor: .black, size: 15, setAlignment: .left)
    private let authorLabel = TBGLabel(radius: 0, setBackgroundColor: UIColor(hex: Color.skin), setText: nil, setTextColor: .black, size: 15, setAlignment: .left)
    private let authorBirthYearHeader = TBGLabel(radius: 0, setBackgroundColor: UIColor(hex: Color.skin), setText: "Birth Year:", setTextColor: .black, size: 15, setAlignment: .left)
    private let authorBirthYearCount = TBGLabel(radius: 0, setBackgroundColor: UIColor(hex: Color.skin), setText: nil, setTextColor: .black, size: 15, setAlignment: .left)
    private let authorDeathYearHeader = TBGLabel(radius: 0, setBackgroundColor: UIColor(hex: Color.skin), setText: "Death Year:", setTextColor: .black, size: 15, setAlignment: .left)
    private let authorDeathYearCount = TBGLabel(radius: 0, setBackgroundColor: UIColor(hex: Color.skin), setText: nil, setTextColor: .black, size: 15, setAlignment: .left)
    private let subjectsHeaderLabel = TBGLabel(radius: 0, setBackgroundColor: UIColor(hex: Color.skin), setText: "Subject:", setTextColor: .black, size: 15, setAlignment: .left)
    private let subjectLabel = TBGLabel(radius: 0, setBackgroundColor: UIColor(hex: Color.skin), setText: nil, setTextColor: .black, size: 15, setAlignment: .left)
    private let readBookButton = TBGButton(radius: 10, setBackgroundColor: .link, title: "Read E-Book", titleColor: .white, size: 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
        setUI()
        setSubviews()
        setLayout()
        setTargets()
    }
    private func setUI() {
        view.backgroundColor = UIColor(hex: Color.skin)
    }
    private func setSubviews() {
        [bookImage, bookTitle, authorHeader, authorLabel, authorBirthYearHeader, authorBirthYearCount, authorDeathYearHeader, authorDeathYearCount, subjectsHeaderLabel, subjectLabel, readBookButton].forEach { elements in
            view.addSubview(elements)
        }
    }
    private func setTargets() {
        readBookButton.addTarget(self, action: #selector(didTappedReadEBookButton), for: .touchUpInside)
    }
    private func setLayout() {
        bookTitle.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20), size: .init(width: 150, height: 80))
        bookTitle.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 125).isActive = true
        
        bookImage.anchor(top: bookTitle.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20), size: .init(width: 300, height: 300))
        bookImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -140).isActive = true
        
        authorHeader.anchor(top: bookImage.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 15, bottom: 0, right: 0), size: .init(width: 100, height: 50))
        authorHeader.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
        
        authorLabel.anchor(top: bookImage.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 110, bottom: 0, right: 0), size: .init(width: 130, height: 50))
        authorLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        authorLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
        
        authorBirthYearHeader.anchor(top: bookImage.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 15, bottom: 0, right: 0), size: .init(width: 80, height: 30))
        authorBirthYearHeader.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80).isActive = true
        
        authorBirthYearCount.anchor(top: bookImage.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 110, bottom: 0, right: 0), size: .init(width: 50, height: 30))
        authorBirthYearCount.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80).isActive = true
        authorBirthYearCount.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        
        authorDeathYearHeader.anchor(top: bookImage.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 15, bottom: 0, right: 0), size: .init(width: 85, height: 30))
        authorDeathYearHeader.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 110).isActive = true
        
        authorDeathYearCount.anchor(top: bookImage.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 110, bottom: 0, right: 0), size: .init(width: 85, height: 30))
        authorDeathYearCount.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 110).isActive = true
        authorDeathYearCount.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        
        subjectsHeaderLabel.anchor(top: bookImage.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 15, bottom: 0, right: 0), size: .init(width: 85, height: 30))
        subjectsHeaderLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 140).isActive = true
        
        subjectLabel.anchor(top: authorDeathYearCount.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 110, bottom: 0, right: 0), size: .init(width: 230, height: 50))
        subjectLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 140).isActive = true
        subjectLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        
        readBookButton.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, size: .init(width: 140, height: 40))
        readBookButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200).isActive = true
        readBookButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    private func setTitleFeatures() {
        bookTitle.addCharactersSpacing(spacing: 0.88, text: bookTitle.text!)
        authorLabel.addCharactersSpacing(spacing: 0.88, text: authorLabel.text!)
        subjectLabel.addCharactersSpacing(spacing: 0.88, text: subjectLabel.text!)
    }
//MARK: - @objc actions
    @objc private func didTappedReadEBookButton() {
        presenter.readEBookTappedButton()
    }
}
//MARK: - BookDetailView Interface
extension BookDetailViewController: BookDetailViewProtocol {
    func update(_ presentation: HomePresentation) {
        bookTitle.text = presentation.title
        if let imageURL = presentation.imageURL {
            bookImage.sd_imageIndicator = SDWebImageActivityIndicator.medium
            bookImage.sd_imageTransition = .fade
            bookImage.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(systemName: SystemImage.placeHolder))
            let authorArray = presentation.authorName[0].components(separatedBy: ", ")
            let newAuthorArray = "\(authorArray[1]) \(authorArray[0])"
            authorLabel.text = newAuthorArray
            let birthYearArray = presentation.authorBirthYear.first
            authorBirthYearCount.text = "\(birthYearArray!)"
            let deathYearArray = presentation.authorDeathYear.first
            authorDeathYearCount.text = "\(deathYearArray!)"
            let mySubjects = presentation.subjects.first
            subjectLabel.text = mySubjects
            setTitleFeatures()
        }
    }
    func handleOutput(output: BookDetailPresenterOutput) {
        switch output {
        case .readEBooktoSafari(let link):
                    guard let url = URL(string: link) else { return }

                    let configuration = SFSafariViewController.Configuration()
                    configuration.entersReaderIfAvailable = true

                    let vc = SFSafariViewController(url: url, configuration: configuration)
                    vc.preferredControlTintColor = .label
                    present(vc, animated: true)
            
        }
    }
}
