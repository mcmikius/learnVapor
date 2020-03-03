//
//  ResourceRequest.swift
//  App
//
//  Created by Mykhailo Bondarenko on 03.03.2020.
//

import Foundation

enum GetResourcesRequest<ResourceType> {
  case success([ResourceType])
  case failure
}

enum SaveResult<ResourceType> {
  case success(ResourceType)
  case failure
}

struct ResourceRequest<ResourceType> where ResourceType: Codable {
  
  let baseURL = "http://localhost:8080/api/"
  let resourceURL: URL
  
  init(resourcePath: String) {
    guard let resourceURL = URL(string: baseURL) else {
      fatalError()
    }
    self.resourceURL = resourceURL.appendingPathComponent(resourcePath)
  }
  func getAll(completion: @escaping (GetResourcesRequest<ResourceType>) -> Void) {
    let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
      guard let jsonData = data else {
        completion(.failure)
        return
      }
      do {
        let decoder = JSONDecoder()
        let resources = try decoder.decode([ResourceType].self, from: jsonData)
        completion(.success(resources))
      } catch {
        completion(.failure)
      }
    }
    dataTask.resume()
  }
}
