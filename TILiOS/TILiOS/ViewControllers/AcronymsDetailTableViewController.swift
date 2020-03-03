//
//  AcronymDetailTableViewController.swift
//  App
//
//  Created by Mykhailo Bondarenko on 03.03.2020.
//

import UIKit

class AcronymDetailTableViewController: UITableViewController {

  // MARK: - Properties
  var acronym: Acronym? {
    didSet {
      updateAcronymView()
    }
  }

  var user: User? {
    didSet {
      updateAcronymView()
    }
  }

  var categories: [Category] = [] {
    didSet {
      updateAcronymView()
    }
  }

  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.prefersLargeTitles = false
    getAcronymData()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    getAcronymData()
  }

  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

  }

  func getAcronymData() {
    
  }

  func updateAcronymView() {
    DispatchQueue.main.async { [weak self] in
      self?.tableView.reloadData()
    }
  }

}

// MARK: - UITableViewDataSource
extension AcronymDetailTableViewController {

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 5
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return section == 3 ? categories.count : 1
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "AcronymDetailCell", for: indexPath)
    cell.selectionStyle = .none
    cell.isUserInteractionEnabled = false
    switch indexPath.section {
    case 0:
      cell.textLabel?.text = acronym?.short
    case 1:
      cell.textLabel?.text = acronym?.long
    case 2:
      cell.textLabel?.text = user?.name
    case 3:
      cell.textLabel?.text = categories[indexPath.row].name
    case 4:
      cell.textLabel?.text = "Add To Category"
      cell.selectionStyle = .default
      cell.isUserInteractionEnabled = true
    default:
      break
    }

    return cell
  }

  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    switch section {
    case 0:
      return "Acronym"
    case 1:
      return "Meaning"
    case 2:
      return "User"
    case 3:
      return "Categories"
    default:
      return nil
    }
  }
}
