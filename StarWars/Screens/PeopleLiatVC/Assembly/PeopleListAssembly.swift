import UIKit
class PeopleListAssembly {
  class func configuredModule() -> UIViewController {
    let view = PeopleListVC()
    let presenter = PeopleListPresenter()
    view.output = presenter
    presenter.view = view
    presenter.dataManager = PeopleManager.shared
    return view
  }
}
