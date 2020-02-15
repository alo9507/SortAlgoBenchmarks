//
//  SearchAlgorithmPerformance.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 2/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

import XCTest
@testable import SortAlgoBenchmarks

class SearchAlgorithmPerformanceTests: XCTestCase {
    var testArray: [Int] = []
    var sortedArray: [Int] = [1,2,3,4,5,6,7,8,9,10]
    
    override func setUp() {
        testArray = [10,4,6,5,3,7,2,8,9,1]
    }
    
    func testLinearSearch() {
        Utils.timeElapsed("Linear Search (BEST): 10,000") {
            let _ = TestFixtures.tenThousand_sorted.linearSearch(for: 1)
        }
        
        Utils.timeElapsed("Linear Search (WORST): 10,000") {
            let _ = TestFixtures.tenThousand_sorted.linearSearch(for: 10000)
        }
        
        Utils.timeElapsed("Linear Search (AVERAGE): 10,000") {
            let _ = TestFixtures.tenThousand_sorted.linearSearch(for: 5000)
        }
    }
    
    func testBinarySearch() {
        Utils.timeElapsed("Binary Search (BEST): 10,000") {
            let _ = TestFixtures.tenThousand_sorted.binarySearch(for: 1)
        }
        
        Utils.timeElapsed("Binary Search (WORST): 10,000") {
            let _ = TestFixtures.tenThousand_sorted.binarySearch(for: 10000)
        }
        
        Utils.timeElapsed("Binary Search (AVERAGE): 10,000") {
            let _ = TestFixtures.tenThousand_sorted.binarySearch(for: 5000)
        }
    }
}
