//
//  AddToCategoryTableViewController.swift
//  App
//
//  Created by Mykhailo Bondarenko on 03.03.2020.
//

import UIKit

class AddToCategoryTableViewController: UITableViewController {

  var categories: [Category] = []
  var selectedCategories: [Category]!
  var acronym: Acronym!

  override func viewDidLoad() {
    super.viewDidLoad()
    loadData()
  }

  func loadData() {
    
  }
}

// MARK: - UITableViewDataSource
extension AddToCategoryTableViewController {

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return categories.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
    let category =  categories[indexPath.row]
    cell.textLabel?.text = category.name
    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
}
