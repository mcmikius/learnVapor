//
//  LoginTableViewController.swift
//  App
//
//  Created by Mykhailo Bondarenko on 03.03.2020.
//

import UIKit

class LoginTableViewController: UITableViewController {

  // MARK: - Properties

  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!

  @IBAction func loginTapped(_ sender: UIBarButtonItem) {
    guard let username = usernameTextField.text, !username.isEmpty else {
      ErrorPresenter.showError(message: "Please enter your username", on: self)
      return
    }

    guard let password = passwordTextField.text, !password.isEmpty else {
      ErrorPresenter.showError(message: "Please enter your password", on: self)
      return
    }
  }
}
