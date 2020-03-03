//
//  CreateCategoryTableViewController.swift
//  App
//
//  Created by Mykhailo Bondarenko on 03.03.2020.
//

import UIKit

class CreateCategoryTableViewController: UITableViewController {

  @IBOutlet weak var nameTextField: UITextField!

  override func viewDidLoad() {
    super.viewDidLoad()
    nameTextField.becomeFirstResponder()
  }

  @IBAction func cancel(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }

  @IBAction func save(_ sender: Any) {
    guard let name = nameTextField.text,
      !name.isEmpty else {
        ErrorPresenter.showError(message: "You must specify a name", on: self)
        return
    }
  }
}
