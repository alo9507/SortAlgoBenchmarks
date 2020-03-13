//
//  FactorialTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/12/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation
import XCTest

@testable import SortAlgoBenchmarks

class FactorialTests: XCTestCase {
    func test_factorial() {
        XCTAssertEqual(120, factorial(5))
    }
}
