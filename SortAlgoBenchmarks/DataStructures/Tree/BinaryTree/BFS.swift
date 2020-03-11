//
//  BFS.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/7/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

/*
 Decision Problem – In this, we search for a feasible solution.
 Optimization Problem – In this, we search for the best solution.
 Enumeration Problem – In this, we find all feasible solutions.
 */

/*
 Given a binary tree, populate an array to represent its level-by-level traversal.
 You should populate the values of all nodes of each level from left to right in separate sub-arrays.
 */

extension BinaryNode {
    func bfs() -> [[Element]] {
        var queue = ArrayQueue<BinaryNode<Element>>()
        var result: [[Element]] = Array(Array())
        
        queue.enqueue(self)
        
        while !queue.isEmpty {
            var levelSize = queue.count
            var level: [Element] = []
            
            for _ in stride(from: 0, to: levelSize, by: 1) {
                let node = queue.dequeue()!
                level.append(node.value)
                
                if node.leftChild != nil {
                    queue.enqueue(node.leftChild!)
                }
                
                if node.rightChild != nil {
                    queue.enqueue(node.rightChild!)
                }
            }
            result.append(level)
        }
        return result
    }
}

/*
 Given a binary tree, populate an array to represent its level-by-level traversal in reverse order, i.e., the lowest level comes first.
 You should populate the values of all nodes in each level from left to right in separate sub-arrays.
 */

extension BinaryNode {
    func reverseBfs() -> [[Element]] {
        var result: [[Element]] = Array(Array())
        var queue = ArrayQueue<BinaryNode<Element>>()
        
        queue.enqueue(self)
        
        while !queue.isEmpty {
            let levelSize = queue.count
            var level: [Element] = []
            
            for _ in stride(from: 0, to: levelSize, by: 1) {
                let node = queue.dequeue()!
                level.append(node.value)
                
                if node.leftChild != nil {
                    queue.enqueue(node.leftChild!)
                }
                
                if node.rightChild != nil {
                    queue.enqueue(node.rightChild!)
                }
            }
            result.insert(level, at: 0)
        }
        
        return result
    }
}

/*
 Given a binary tree, populate an array to represent its zigzag level order traversal.
 You should populate the values of all nodes of the first level from left to right,
 then right to left for the next level.
 Keep alternating in the same manner for the following levels.
 */

extension BinaryNode {
    func zigZag() -> [[Element]] {
        var queue = ArrayQueue<BinaryNode<Element>>()
        var result: [[Element]] = Array(Array())
        
        queue.enqueue(self)
        
        var leftToRight = true
        while !queue.isEmpty {
            let levelSize = queue.count
            var level: [Element] = []
            
            // iterate over all elements of the queue
            for _ in stride(from: 0, to: levelSize, by: 1) {
                let node = queue.dequeue()!
                
                if leftToRight {
                    level.append(node.value)
                } else {
                    level.insert(node.value, at: 0)
                }
                
                // add left child for next while loop iteration
                if node.leftChild != nil {
                    queue.enqueue(node.leftChild!)
                }
                
                // add right child for next while loop iteration
                if node.rightChild != nil {
                    queue.enqueue(node.rightChild!)
                }
            }
            result.append(level)
            leftToRight = !leftToRight
        }
        return result
    }
}

/*
 Given a binary tree, populate an array to represent the averages of all of its levels.
 */

extension BinaryNode where Element == Int {
    func levelAverages() -> [Double] {
        var averages: [Double] = Array()
        var queue = ArrayQueue<BinaryNode<Element>>()
        
        queue.enqueue(self)
        
        while !queue.isEmpty {
            let levelSize = queue.count
            var sum: Int = 0
            
            for _ in stride(from: 0, to: levelSize, by: 1) {
                let node = queue.dequeue()!
                sum += node.value
                
                if node.leftChild != nil {
                    queue.enqueue(node.leftChild!)
                }
                
                if node.rightChild != nil {
                    queue.enqueue(node.rightChild!)
                }
            }
            averages.append(Double(sum / levelSize))
        }
        
        return averages
    }
}
