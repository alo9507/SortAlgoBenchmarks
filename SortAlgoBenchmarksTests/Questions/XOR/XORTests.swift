//
//  XORTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/8/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation
import XCTest

@testable import SortAlgoBenchmarks

class XORTests: XCTestCase {
    func test_findMissingNumberNonXOR() {
        let testArrray = Array(2...100)
        XCTAssertEqual(1, findMissingNumber_nonxor(testArrray))
    }
    
    func test_findMissingNumber_XOR() {
        let testArrray = [1, 5, 2, 6, 4]
        XCTAssertEqual(3, findMissingNumber_xor(testArrray))
    }
    
    func test_findNonDuplicate() {
        let testArrray = [1, 4, 2, 1, 3, 2, 3]
        XCTAssertEqual(4, findNonDuplicate(testArrray))
    }
}
