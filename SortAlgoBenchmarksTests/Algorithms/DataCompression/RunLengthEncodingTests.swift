//
//  RunLengthEncoding.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 4/10/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import XCTest
@testable import SortAlgoBenchmarks

class RunLengthEncodingTests: XCTestCase {
    func test_runLengthEncoding_emptyStream() {
        let testString = ""
        print(RunLengthEncoding.encode(input: testString))
    }
    
    func test_runLengthEncoding_01() {
        let testString = "01"
        print(RunLengthEncoding.encode(input: testString))
    }
    
    func test_runLengthEncoding_0011() {
        let testString = "0011"
        print(RunLengthEncoding.encode(input: testString))
    }
}
