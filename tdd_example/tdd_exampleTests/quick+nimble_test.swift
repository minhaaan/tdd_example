//
//  quick+nimble_test.swift
//  tdd_exampleTests
//
//  Created by 최민한 on 2022/06/01.
//

import XCTest
import Nimble
import Quick

class quick_nimble_test: QuickSpec {

  override func spec() {
    describe("describe") {
      it("has everything you need to get started") {
        let a = 1
        expect(a).to(equal(1))
      }
      
    }
  }
}
