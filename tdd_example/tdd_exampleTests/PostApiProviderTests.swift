//
//  PostApiProviderTests.swift
//  tdd_exampleTests
//
//  Created by 최민한 on 2022/06/01.
//

import XCTest
@testable import tdd_example

class PostApiProviderTests: XCTestCase {
  
  var sut: APIProvider!
  
  override func setUpWithError() throws {
    sut = APIProvider(isStub: true)
  }
  
  override func tearDownWithError() throws {
  }
  
  func test_posts_success() {
    let expectation = XCTestExpectation()
    
    sut.posts()
      .subscribe(onSuccess: { posts in
        XCTAssertEqual(posts, [])
        expectation.fulfill()
      })
      .dispose()
    
    wait(for: [expectation], timeout: 2.0)
  }
  
  
}
