//
//  BFS.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/7/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

/*
 Given a binary tree, populate an array to represent its level-by-level traversal.
 You should populate the values of all nodes of each level from left to right in separate sub-arrays.
 */

extension BinaryNode {
    func bfs() -> [[Element]] {
        var result: [[Element]] = []
        var queue: ArrayQueue<BinaryNode<Element>> = ArrayQueue()
        
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
            result.append(level)
        }
        return result
    }
}
