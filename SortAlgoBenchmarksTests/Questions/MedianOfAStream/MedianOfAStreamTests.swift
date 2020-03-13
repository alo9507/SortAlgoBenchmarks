//
//  MedianOfAStreamTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/12/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation
import XCTest

@testable import SortAlgoBenchmarks

class MedianOfAStreamTests: XCTestCase {
    func test_medianOfAStream() {
        let medianClass = MedianOfAStream()
        medianClass.insertNum(3)
        medianClass.insertNum(1)
        XCTAssertEqual(2, medianClass.findMedian())
        medianClass.insertNum(5)
        XCTAssertEqual(3, medianClass.findMedian())
        medianClass.insertNum(4)
        XCTAssertEqual(3.5, medianClass.findMedian())
    }
}
