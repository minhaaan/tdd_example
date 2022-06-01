//
//  PostApiTest.swift
//  tdd_exampleTests
//
//  Created by 최민한 on 2022/06/01.
//

import XCTest
import Moya
@testable import tdd_example

class PostApiTest: XCTestCase {
  
  var provider: MoyaProvider<PostsApi>!
  
  override func setUpWithError() throws {
  }
  
  override func tearDownWithError() throws {
    provider = nil
  }
  
  func postsWhenSuccess() {
    //Given
    let endpoint = { (target: PostsApi) -> Endpoint in
      return Endpoint(url: URL(target: target).absoluteString,
                      sampleResponseClosure: { .networkResponse(200, target.sampleData) },
                      method: target.method,
                      task: target.task,
                      httpHeaderFields: target.headers)
    }
    provider = MoyaProvider<PostsApi>(endpointClosure: endpoint, stubClosure: MoyaProvider.immediatelyStub)
    var data: [Post]? = nil
    
    // When
    provider.request(.init()) { result in
      switch result {
      // Then
      case .success(let res):
        data = try? JSONDecoder().decode([Post].self, from: res.data)
        XCTAssertEqual(res.statusCode, 200)
        XCTAssertNotNil(data)
      case .failure(let err):
        XCTAssertNil(err)
      }
    }
  }
  
  func postsWhenFailure() {
    
  }
  
  
}
