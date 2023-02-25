//
//  HomeInteractor.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/23/23.
//

import Foundation

final class HomeListInteractor: BookListInteractorProtocol {
    
    weak var delegate: BookListInteractorDelegate?
    
    private let service: BooksServiceInterface
    private var books: [BooksResult] = []
    private var currentPage: Int = 1
    
    init(service: BooksServiceInterface = BooksService(service: CoreService())) {
        self.service = service
    }
    
    func load() {
        delegate?.handleOutput(.setLoading(true))
        service.fetchBooks(endPoint: .getTopicBooks(page: currentPage)) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.delegate?.handleOutput(.setLoading(false))
                switch result {
                case .success(let book):
                    self.books = book.results
                    self.delegate?.handleOutput(.showBookList(book.results))
                case .failure(let error):
                    print("error \(error.localizedDescription)")
                }
            }
        }
    }
    func selectBook(at index: Int) {
        let book = books[index]
        delegate?.handleOutput(.showBookDetail(book))
    }
}
