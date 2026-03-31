//
//  BreedListViewController.swift
//  DogPhotosApp
//

import UIKit

final class BreedListViewController: UIViewController {
  
  private var tableView: UITableView!
  /// Stub breed names for the interviewee to replace with API data.
  private let breeds: [String] = ["Breed1", "Breed2", "Breed3", "Breed4", "Breed5"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Breeds"
    view.backgroundColor = .systemBackground
    setupTableView()
  }
  
  private func setupTableView() {
    tableView = UITableView(frame: .zero, style: .plain)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BreedCell")
    view.addSubview(tableView)
    NSLayoutConstraint.activate([
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
  }
}

extension BreedListViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    breeds.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "BreedCell", for: indexPath)
    cell.textLabel?.text = breeds[indexPath.row]
    cell.accessoryType = .disclosureIndicator
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let breed = breeds[indexPath.row]
    let grid = PhotoGridViewController(breedName: breed)
    navigationController?.pushViewController(grid, animated: true)
  }
}
