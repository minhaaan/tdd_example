import Moya
import Foundation
import RxSwift

class APIProvider: ProviderProtocol {
  typealias T = PostsApi
  var provider: MoyaProvider<PostsApi>
  
  required init(isStub: Bool = false, sampleStatusCode: Int = 200, customEndpointClosure: ((PostsApi) -> Endpoint)? = nil) {
    provider = Self.consProvider(isStub, sampleStatusCode, customEndpointClosure)
  }
  
  func posts() -> Single<[Post]> {
    request(type: [Post].self, atKeyPath: "value", target: .init())
  }
  
  
}
