//
//  MedianOfAStream.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/12/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

class MedianOfAStream {
    var minHeap: Heap = Heap<Int>([], areSorted: <)
    var maxHeap: Heap = Heap<Int>([], areSorted: >)
    
    func insertNum(_ number: Int) {
        if (maxHeap.isEmpty || maxHeap.peek()! >= number) {
            maxHeap.push(number)
        } else {
            minHeap.push(number)
        }
        
        if (maxHeap.count > minHeap.count + 1) {
            minHeap.push(maxHeap.pop()!)
        } else if (maxHeap.count < minHeap.count) {
            maxHeap.push(minHeap.pop()!)
        }
    }
    
    var count: Int {
        return minHeap.count + maxHeap.count
    }
    
    func findMedian() -> Double {
        if maxHeap.count == minHeap.count {
            let max = maxHeap.peek() ?? 0
            let min = maxHeap.peek() ?? 0
            return Double(max / 2 + min / 2)
        }
        
        return Double(maxHeap.peek() ?? 0)
    }
}
