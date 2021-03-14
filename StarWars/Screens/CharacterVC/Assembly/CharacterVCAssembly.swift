import UIKit
class CharacterVCAssembly {
  class func configuredModule(character:People) -> UIViewController {
    let view = CharacterVC()
    view.character = character
    return view
  }
}
