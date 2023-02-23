//
//  CheckFirstLoginMethod.swift
//  TheBookGallery
//
//  Created by Kaan Yeyrek on 2/4/23.
//

import Foundation
// Check first login for userDefaults
class CheckFirstLoginMethod {
    static let shared = CheckFirstLoginMethod()
    
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    func setIsNotNewUser() {
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}
