import UIKit
class CharacterVC: UIViewController {
  var character:People!
  lazy var textLabel : UILabel = {
    let l = UILabel()
    l.backgroundColor = .black
    l.textColor = .yellow
    l.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    l.textAlignment = .center
    l.numberOfLines = 0
    return l
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupConstraints()
  }
  
  private func setupUI() {
    textLabel.layer.borderWidth = 10.0
    textLabel.layer.cornerRadius = UIScreen.main.bounds.width * 0.1
    textLabel.layer.borderColor = UIColor.yellow.cgColor
    textLabel.text =
      """
      name\n\(String(describing: character.name ?? ""))\n
      birth\n\(String(describing: character.birth_year ?? ""))\n
      created\n\(String(describing: character.created ?? ""))\n
      hair color\n\(String(describing: character.hair_color ?? ""))\n
      eye color\n\(String(describing: character.eye_color ?? ""))\n
      skin_color\n\(String(describing: character.skin_color ?? ""))\n
      mass\n\(String(describing: character.mass ?? ""))\n
      """
    view.addSubview(textLabel)
  }
  
  private func setupConstraints() {
    textLabel.translatesAutoresizingMaskIntoConstraints = false
    textLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    textLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
}
