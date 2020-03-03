//
//  Token.swift
//  App
//
//  Created by Mykhailo Bondarenko on 03.03.2020.
//

import Foundation

final class Token: Codable {
  var id: UUID?
  var token: String
  var userID: UUID

  init(token: String, userID: UUID) {
    self.token = token
    self.userID = userID
  }
}
