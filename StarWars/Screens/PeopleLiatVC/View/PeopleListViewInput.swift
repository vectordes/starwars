import Foundation
protocol PeopleListViewInput: AnyObject {
  func reloadTableView()
  func presentCharacterVC(character:People)
}
