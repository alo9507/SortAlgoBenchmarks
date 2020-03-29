//
//  Fibonnaci.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/29/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

/*
 A dynamic programming problem is one in which the solution is composed of solutions ot hte same problem with smaller inputs
 This is the "optimal subsctructure" property
 Before using DP, you should prove that the problem has some redundancy in it. The "Cut and paste technique"
 
 The proof is by contradiction. Suppose you came up with an optimal solution to a problem by using suboptimal solutions to subproblems. Then, if you were to replace ("cut") those suboptimal subproblem solutions with optimal subproblem solutions (by "pasting" them in), you would improve your optimal solution.
 
 A bottom-up algorithm "starts at the beginning"
 A recursive algorithm "starts from the end and works backwards"
 */

enum Fibonacci {
    /// Returns the nth fibonacci number
    /// - Parameter n: the nth fibonnaci number
    static func fib(of n: Int) -> Int {
        if n <= 1 { return n }
        return fib(of: n-1) + fib(of: n-2)
    }
    
    /// Returns the nth fibonacci number
    /// - Parameter n: the nth fibonnaci number
    static func fib_memoized(of n: Int) -> Int {
        var memo: [Int: Int] = [:]
        
        func innerFib(of n: Int) -> Int {
            if let result = memo[n] {
                return result
            }
            if n <= 1 { return n }
            let result = innerFib(of: n-1) + innerFib(of: n-2)
            memo[n] = result
            return result
        }
        
        return innerFib(of: n)
    }
    
    /// Going bottom-up is a way to avoid recurison, saving the memory cost that recursion incurs whet it builds up the call stack
    /// - Parameter n: nth Fib number
    static func fib_bottomUp(of n: Int) -> Int {
        if n <= 1 { return n }
        var bottomUp: [Int] = []
        
        bottomUp.insert(0, at: 0)
        bottomUp.insert(1, at: 1)
        bottomUp.insert(1, at: 2)
        
        for i in stride(from: 3, through: n, by: 1) {
            bottomUp.insert(bottomUp[i-1] + bottomUp[i-2], at: i)
        }
        return bottomUp[n]
    }
}
