import UIKit

class PeopleListVC: UIViewController, PeopleListViewInput {
  var output: PeopleListViewOutput!
  
  lazy var tableView: UITableView = {
    let tv = UITableView(frame: .zero, style: .plain)
    tv.tableFooterView = UIView()
    tv.backgroundColor = .black
    tv.register(UITableViewCell.self, forCellReuseIdentifier: "reuseID")
    return tv
  }()
  
  lazy var imageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.image = #imageLiteral(resourceName: "starWarsLogo")
    return iv
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupConstraints()
    output.subscribe(tableView: tableView)
    output.viewLoaded()
  }
    
  func reloadTableView() {
    self.tableView.reloadData()
  }
  
  func presentCharacterVC(character:People) {
    DispatchQueue.main.async {
      let vc = CharacterVCAssembly.configuredModule(character: character)
      self.present(vc, animated: true)
    }
  }
}

//MARK: - UI
extension PeopleListVC {
  private func setupUI() {
    imageView.frame = CGRect(x: 0, y: 0 , width: self.view.frame.width, height: self.view.frame.height * 0.3)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseID")
    tableView.tableHeaderView = imageView
    view.addSubview(tableView)
  }
  private func setupConstraints() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
}
