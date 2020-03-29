//
//  Fibonnaci.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/29/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import XCTest
@testable import SortAlgoBenchmarks

class FibonnaciTests: XCTestCase {
    func test_fib() {
        XCTAssertEqual(3, Fibonacci.fib(of: 4))
        XCTAssertEqual(5, Fibonacci.fib(of: 5))
        XCTAssertEqual(8, Fibonacci.fib(of: 6))
        
        XCTAssertEqual(8, Fibonacci.fib_bottomUp(of: 6))
        
        Utils.timeElapsed("Non-memoized Fibonnaci") {
            XCTAssertEqual(75025, Fibonacci.fib(of: 25))
        }
        
        Utils.timeElapsed("Memoized Fibonnaci") {
            XCTAssertEqual(75025, Fibonacci.fib_memoized(of: 25))
        }
        
        
    }
}
