import Foundation
import Alamofire
import SwiftyJSON

struct RequestHandler {
  private let hostUrl = "https://swapi.dev/api/"
  private let path: String  // request === endPoint (path)
  private var headers: HTTPHeaders = [:]
  var responseKey:String = ""
  private var completeURL: String  {
    return hostUrl + path
  }
  
  init(path:String) {
    self.path = path
    self.responseKey = ""
  }
  
  init(path:String, responseKey:String) {
    self.path = path
    self.responseKey = responseKey
  }
  
  func addHeader(name:String, value: String) -> RequestHandler {
    var new = self
    new.headers[name] = value
    return new
  }
  
  private func fetchHeaders() -> HTTPHeaders {
    return []
  }
  
  @discardableResult
  func responseJSON(_ closure: ((JSON) -> Void)?) -> RequestHandler {
    var mainHeaders = fetchHeaders()
    for header in headers {
      mainHeaders[header.name] = header.value
    }
    AF.request(completeURL, method: .get, headers: mainHeaders)
      .responseData { (response) in
        if let data = response.data {
          let json = (try? JSON(data: data)) ?? JSON()
          closure?(json)
        } else {
          closure?(JSON())
        }
      }
    return self
  }
  
  @discardableResult
  func response<T:Codable>(_ closure: ((T?) -> ())?) -> RequestHandler {
    responseJSON { (json) in
      let finalJSON = responseKey == "" ? json : json[responseKey]
      let genericValue = T.from(finalJSON)
      closure?(genericValue)
    }
  }
}

