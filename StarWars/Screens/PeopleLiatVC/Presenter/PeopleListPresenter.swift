import UIKit

class PeopleListPresenter: PeopleListViewOutput {
  weak var view: PeopleListViewInput!
  var dataManager:PeopleManager!
  private let dataSource: PeopleListDataSource = .init()
  
  func didPressedAction(_ number: Int) {
    loadCharacter(number:number)
  }
  
  func subscribe(tableView: UITableView) {
    tableView.dataSource = dataSource
    tableView.delegate = dataSource
    dataSource.output = self //*
  }

  func viewLoaded() {
    loadData()
  }

  func loadData() {
    self.dataManager.fetchPeopleList { peopleList in
      self.dataSource.load(peopleList: peopleList ?? [])
      self.view.reloadTableView()
    }
  }
  
  func loadCharacter(number:Int) {
    self.dataManager.fetchCharacterWith(number) { (character) in
      if character?.name != nil {
        self.view.presentCharacterVC(character: character!)
      }
    }
  }
}

