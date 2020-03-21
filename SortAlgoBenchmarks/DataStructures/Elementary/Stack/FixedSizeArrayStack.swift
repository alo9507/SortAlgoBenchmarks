//
//  FixedSizeArrayStack.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/21/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

// Push: (amortized) O(1) (~ 3N)
// Pop: O(1)
// Count: O(1)
// Space: O(N)

// Amortization Explanation
// We only resize with O(N) cost every time N doubles
// But by the time we resize, we've added that many items into the stack
// So on average it's like adding one operation
// Instead of sum of integers from one to N, we have the sum of powers of 2 from one to N
// N + (2 + 4 + 8 + 16... + N) ~ 3N
// Amortized Analysis considers total cost averaged over all operations
struct FixedSizeArrayStack<Element>: Stack, Sequence, IteratorProtocol {
    var size: Int = 0
    private var storage = [Element?](repeating: nil, count: 1)
    
    var isEmpty: Bool {
        return size == 0
    }
    
    var count: Int {
        return size
    }
    
    var peek: Element? {
        return isEmpty ? nil : storage[size - 1]
    }
    
    // Thrashing: Push-pop when array is full causing O(N) time for all operations
    @discardableResult
    mutating func pop() -> Element? {
        // return nil in the case of underflow
        guard !isEmpty else { return nil }
        
        // Resize when storage is only a quarter full.
        // This has better worst case (thrashing scenario) compared to repeated halving plus repeated doubling
        if (size == storage.count / 4) { resize(size/2) }
        
        size -= 1
        return storage[size]
    }
    
    mutating func push(_ element: Element) {
        // Resize in the case of overflow
        // Only create a new array every time it doubles
        if size == storage.count {
            // Use "repeated doubling" method
            resize(size*2)
        }
        storage[size] = element
        size += 1
    }
    
    private mutating func resize(_ capacity: Int) {
        var newStorage = [Element?](repeating: nil, count: capacity)
        for i in stride(from: 0, through: size - 1, by: 1) {
            newStorage[i] = storage[i]
        }
        storage = newStorage
    }

}

extension FixedSizeArrayStack {
    mutating func next() -> Element? {
        return pop()
    }
}

extension FixedSizeArrayStack: CustomStringConvertible {
    var description: String {
        return storage
            .map { "\($0)" }
            .joined(separator: " ")
    }
}
