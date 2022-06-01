//
//  PostApiTest.swift
//  tdd_exampleTests
//
//  Created by 최민한 on 2022/06/01.
//

import XCTest
@testable import tdd_example
@testable import Moya

class PostApiTest: XCTestCase {
  
  var provider: MoyaProvider<PostsApi>!
    
  override func setUpWithError() throws {
  }
  
  override func tearDownWithError() throws {
    provider = nil
  }
  
  func testPostWhenSuccess() {
    //Given
    let expectation = self.expectation(description: "requst")
    
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
        XCTAssertEqual(data?.count, 5)
        expectation.fulfill()
      case .failure:
        XCTFail()
      }
    }
    XCTAssertNotNil(data)
    self.waitForExpectations(timeout: 5.0)
  }
  
  func testPostsWhenFailure() {
    // Given
    let expectation = self.expectation(description: "requst")
    
    let endPoint = { (target: PostsApi) -> Endpoint in
      Endpoint(
        url: URL(target: target).absoluteString,
        sampleResponseClosure: { .networkResponse(500, Data()) },
        method: target.method,
        task: target.task,
        httpHeaderFields: target.headers
      )
    }
    provider = MoyaProvider<PostsApi>(
      endpointClosure: endPoint,
      stubClosure: MoyaProvider.immediatelyStub
    )
    
    // When
    provider.request(PostsApi()) { result in
      // Then
      switch result {
      case .success(let res):
        let posts = try? JSONDecoder().decode([Post].self, from: res.data)
        XCTAssertNil(posts)
        XCTAssertEqual(res.statusCode, 500)
        expectation.fulfill()
      case .failure:
        XCTFail()
      }
    }
    self.waitForExpectations(timeout: 5.0)
  }
  
  
}
