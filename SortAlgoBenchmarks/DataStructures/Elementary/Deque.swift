//
//  Deque.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/14/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// https://github.com/raywenderlich/swift-algorithm-club/tree/master/Deque
public struct Deque<T> {
    private var array = [T?]()
    private var head: Int
    private var capacity: Int
    private let originalCapacity: Int
    
    public init(_ capacity: Int = 10) {
        self.capacity = max(capacity, 1)
        originalCapacity = self.capacity
        array = [T?](repeating: nil, count: capacity)
        head = capacity
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    // if you enqueue a lot of elements, you'll run out of space at the front
    // the array automatically resizes the back of the array
    public mutating func enqueueFront(_ element: T) {
        if head == 0 {
            capacity *= 2
            let emptySpace = [T?](repeating: nil, count: capacity)
            array.insert(contentsOf: emptySpace, at: 0)
            head = capacity
        }
        
        head -= 1
        array[head] = element
    }
    
    public mutating func dequeue() -> T? {
      guard head < array.count, let element = array[head] else { return nil }

      array[head] = nil
      head += 1

      if capacity >= originalCapacity && head >= capacity*2 {
        let amountToRemove = capacity + capacity/2
        array.removeFirst(amountToRemove)
        head -= amountToRemove
        capacity /= 2
      }
      return element
    }
    
    public mutating func dequeueBack() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeLast()
        }
    }
    
    public func peekFront() -> T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
    
    public func peekLast() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.last!
        }
    }
}
