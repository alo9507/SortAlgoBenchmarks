//
//  RoadsAndLibrariesTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/14/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation
import XCTest

@testable import SortAlgoBenchmarks

class RoadsAndLibrariesTests: XCTestCase {
    func test_roadsAndLibraries() {
        let cities = [[1,2], [3,1], [2,3]]
        XCTAssertEqual(120, roadsAndLibraries(n: 3, c_lib: 2, c_road: 1, cities: cities))
    }
}
