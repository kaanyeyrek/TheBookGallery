//
//  NetworkError.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/4/23.
//

import Foundation

enum NetworkError: String, Error {
    case badURL
    case badResponse
    case unauthorized
    case unexpectedStatusCode
    case badData
    case decoding
}
