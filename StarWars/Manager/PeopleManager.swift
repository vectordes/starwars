import Foundation
import CoreLocation

class PeopleManager {
  static let shared = PeopleManager()
  
  private init() {}
  
  func fetchPeopleList(closure: (([People]?) -> Void)?) {
    
    RequestHandler(path: "people/", responseKey: "results")
      .response { (model:[People]?) in
        closure?(model)
      }
    
  }
  func fetchCharacterWith(_ number:Int, closure: ((People?) -> Void)?) {
    
    RequestHandler(path: "people/\(number)/")
      .response { (model:People?) in
        closure?(model)
      }
  }
}

