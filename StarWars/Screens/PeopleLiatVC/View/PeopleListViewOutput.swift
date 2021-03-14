import UIKit
protocol PeopleListViewOutput {
  func viewLoaded()
  func subscribe(tableView: UITableView)
  func didPressedAction(_ number: Int)
}
