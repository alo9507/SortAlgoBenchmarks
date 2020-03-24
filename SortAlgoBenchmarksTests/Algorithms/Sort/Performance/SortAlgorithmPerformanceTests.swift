//
//  SortAlgoBenchmarksTests.swift
//  SortAlgorithmPerformanceTests
//
//  Created by Andrew O'Brien on 2/13/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import XCTest
@testable import SortAlgoBenchmarks

class SortAlgorithmPerformanceTests: XCTestCase {
    
    var testArray: [Int] = []
    var sortedArray: [Int] = [1,2,3,4,5,6,7,8,9,10]
    
    override func setUp() {
        testArray = [10,4,6,5,3,7,2,8,9,1]
    }
    
    func testSwiftSort() {
        Utils.timeElapsed("Swift Sort (inplace): SORTED") {
            TestFixtures.tenThousand_sorted.sort()
        }
        
        Utils.timeElapsed("Swift Sort (inplace): RANDOM(1...10000)") {
            TestFixtures.tenThousand_random.sort()
        }
        
        Utils.timeElapsed("Swift Sort (copy): SORTED") {
            let _ = TestFixtures.tenThousand_sorted.sorted()
        }
        
        Utils.timeElapsed("Swift Sort (copy): RANDOM(1...10000)") {
            let _ = TestFixtures.tenThousand_random.sorted()
        }
    }
    
    func testBubbleSort() {
        BubbleSort.sort(&testArray)
        XCTAssertTrue(testArray == sortedArray)
        
        //        Utils.timeElapsed("Bubble Sort: SORTED") {
        //            BubbleSort.sort(&TestFixtures.tenThousand_sorted)
        //        }
        //
        //        Utils.timeElapsed("Bubble Sort: RANDOM(1...10000)") {
        //            BubbleSort.sort(&TestFixtures.tenThousand_random)
        //        }
    }
    
    func testInsertionSort() {
        InsertionSort.sort_semantic(&testArray)
        XCTAssertTrue(testArray == sortedArray)
        
//        Utils.timeElapsed("Insertion Sort: SORTED") {
//            InsertionSort.sort(&TestFixtures.tenThousand_sorted)
//        }
//
//        Utils.timeElapsed("Insertion Sort: RANDOM(1...10000)") {
//            InsertionSort.sort(&TestFixtures.tenThousand_random)
//        }
    }
    
    func testSelectionSort() {
        SelectionSort.sort(&testArray)
        XCTAssertTrue(testArray == sortedArray)
        
//        Utils.timeElapsed("Selection Sort: SORTED") {
//            SelectionSort.sort(&TestFixtures.tenThousand_sorted)
//        }
//
//        Utils.timeElapsed("Selection Sort: RANDOM(1...10000)") {
//            SelectionSort.sort(&TestFixtures.tenThousand_random)
//        }
    }
    
        func testShellSort() {
            Shellsort.sort(&testArray)
            XCTAssertTrue(testArray == sortedArray)
            
    //        Utils.timeElapsed("Selection Sort: SORTED") {
    //            SelectionSort.sort(&TestFixtures.tenThousand_sorted)
    //        }
    //
    //        Utils.timeElapsed("Selection Sort: RANDOM(1...10000)") {
    //            SelectionSort.sort(&TestFixtures.tenThousand_random)
    //        }
        }
    
    // BEST, WORST and AVERAGE: O(n log n).
    // Sifting down is a O(log n) operation. In heapsort, you siftDown n times, giving you O(n log n) complexity
    func testHeapSort() {
        Utils.timeElapsed("Heap Sort: RANDOM") {
            let heap = Heap(TestFixtures.tenThousand_random, areSorted: <)
            Array(heap)
        }
        
        Utils.timeElapsed("Heap Sort: SORTED") {
            let heap = Heap(TestFixtures.tenThousand_sorted, areSorted: <)
            Array(heap)
        }
    }
    
    func testMergeSort() {
        Utils.timeElapsed("MERGE SORT: RANDOM") {
            let _ = Merge.sort(TestFixtures.tenThousand_random)
        }
        
        Utils.timeElapsed("MERGE SORT: SORTED") {
            let _ = Merge.sort(TestFixtures.tenThousand_sorted)
        }
    }
}
