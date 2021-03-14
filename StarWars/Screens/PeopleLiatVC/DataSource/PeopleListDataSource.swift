import UIKit

class PeopleListDataSource: NSObject {
  private(set) var peopleList: [People] = []
  var output: PeopleListViewOutput!
  func load(peopleList: [People]) {
    self.peopleList = peopleList
  }
}

extension PeopleListDataSource: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return peopleList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "reuseID")
    cell.textLabel?.text = peopleList[indexPath.row].name
    cell.accessoryType = .none
    cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
    cell.selectionStyle = .none
    cell.backgroundColor = UIColor.clear
    cell.textLabel?.textColor = .yellow
    cell.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    cell.textLabel?.textAlignment = .center
    
    let scale:CGFloat = CGFloat(indexPath.row) * 0.1
    cell.transform = CGAffineTransform.init(scaleX: scale, y: scale)
    UIView.animate(withDuration: 0.4, delay: 0.05 * Double(indexPath.row), animations: {
      cell.transform = CGAffineTransform.init(scaleX: 1, y: 1)
    })
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
}

extension PeopleListDataSource: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: false)
    output?.didPressedAction(indexPath.row + 1)
  }
}
