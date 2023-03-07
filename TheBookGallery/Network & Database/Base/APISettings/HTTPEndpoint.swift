//
//  HTTPEndpoint.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/4/23.
//

import Foundation

protocol HTTPEndpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var query: [URLQueryItem] { get }
    var method: HTTPMethod { get }
}

extension HTTPEndpoint {
    var scheme: String {
        return "https"
    }
    var host: String {
        return "gutendex.com"
    }
    var method: HTTPMethod {
        return .get
    }
}
