//
//  Auth.swift
//  App
//
//  Created by Mykhailo Bondarenko on 03.03.2020.
//

import Foundation
import UIKit

enum AuthResult {
  case success
  case failure
}

class Auth {
  static let defaultsKey = "TIL-API-KEY"
  let defaults = UserDefaults.standard

  var token: String? {
    get {
      return defaults.string(forKey: Auth.defaultsKey)
    }
    set {
      defaults.set(newValue, forKey: Auth.defaultsKey)
    }
  }
  
  func logout() {
    self.token = nil
    DispatchQueue.main.async {
      guard let applicationDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
      }
      let rootController = UIStoryboard(name: "Login", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginNavigation")
      applicationDelegate.window?.rootViewController = rootController
    }
  }

  func login(username: String, password: String, completion: @escaping (AuthResult) -> Void) {
    let path = "http://localhost:8080/api/users/login"
    guard let url = URL(string: path) else {
      fatalError()
    }
    guard let loginString = "\(username):\(password)".data(using: .utf8)?.base64EncodedString() else {
      fatalError()
    }

  }
}
