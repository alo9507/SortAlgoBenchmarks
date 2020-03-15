//
//  PalindromTest.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation
import XCTest

@testable import SortAlgoBenchmarks

class PalindromTests: XCTestCase {
    func test_palindrome() {
        XCTAssertTrue(isPalindrom(""))
        XCTAssertTrue(isPalindrom("a"))
        XCTAssertTrue(isPalindrom("aba"))
        XCTAssertTrue(isPalindrom("aabaa"))
        XCTAssertFalse(isPalindrom("sdfsdf"))
        XCTAssertTrue(isPalindrom("aabbaa"))
    }
}
