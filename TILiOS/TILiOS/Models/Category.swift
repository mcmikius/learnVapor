//
//  Category.swift
//  App
//
//  Created by Mykhailo Bondarenko on 03.03.2020.
//

final class Category: Codable {
  var id: Int?
  var name: String

  init(name: String) {
    self.name = name
  }
}
