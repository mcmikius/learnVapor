//
//  AcronymsTableViewController.swift
//  App
//
//  Created by Mykhailo Bondarenko on 03.03.2020.
//

import UIKit

class AcronymsTableViewController: UITableViewController {

  // MARK: - Properties

  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.tableFooterView = UIView()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    refresh(nil)
  }

  func refresh() {
    if refreshControl != nil {
      refreshControl?.beginRefreshing()
    }
    refresh(refreshControl)
  }

  @IBAction func refresh(_ sender: UIRefreshControl?) {
    
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

  }
}

// MARK: - UITableViewDataSource
extension AcronymsTableViewController {

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "AcronymCell", for: indexPath)
    return cell
  }
}
