//
//  AcronymRequest.swift
//  App
//
//  Created by Mykhailo Bondarenko on 03.03.2020.
//

import Foundation

enum AcronymUserRequestResult {
  case success(User)
  case failure
}

enum CategoryAddResult {
  case success
  case failure
}

struct AcronymRequest {
  let resource: URL
  
  init(acronymID: Int) {
    let resourceString = "http://localhost:8080/api/acronyms/\(acronymID)"
    guard let resourceURL = URL(string: resourceString) else {
      fatalError()
    }
    self.resource = resourceURL
  }
  
  func delete() {
    guard let token = Auth().token else {
      Auth().logout()
      return
    }
    var urlRequest = URLRequest(url: resource)
    urlRequest.httpMethod = "DELETE"
    urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    let dataTask = URLSession.shared.dataTask(with: urlRequest)
    dataTask.resume()
  }
  
}
