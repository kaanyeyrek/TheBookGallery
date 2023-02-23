//
//  BooksService.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/5/23.
//

import Foundation

protocol BooksServiceInterface {
    func fetchBooks(endPoint: BooksEndPoint, completion: @escaping (Result<Books, NetworkError>) -> Void)
}

final class BooksService: BooksServiceInterface {
    private let service: CoreServiceInterface!
    
    init(service: CoreServiceInterface!) {
        self.service = service
    }
    func fetchBooks(endPoint: BooksEndPoint, completion: @escaping (Result<Books, NetworkError>) -> Void) {
        service.fetch(endPoint: endPoint) { (result: Result<Books, NetworkError>) in
            completion(result)
        }
    }
}
