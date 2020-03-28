//
//  FiniteAutomaton.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/28/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// GOAL: Check whether input matches pattern

// Digraph reachability: Find all vertices reachable from a given source or set of vertices
// Single-source reachability
// Set of sources reachability

// state names: integers from 0 to M
// match-transitions: keep regex in array re[]
// epsilon transitions: Store in a digraph G

// keep track of all possible states an NFA can be in after reading the i'th character


// Start at state 0
    // Find states reachable by epsilon transitions
    // Find states reachable by match-transitions

// If after reading pattern, terminal state is in transition states, the string is accepted
// return reachableStates.contains(terminalState)

class NFA {
    private var re: [Character]
    private var G: AdjacencyList<Int> = AdjacencyList<Int>()
    private var M: Int
    
    init(regex: String) {
        self.M = regex.count 
        self.re = Array(regex)
        self.G = buildEpsilonTransitionDigraph()
    }
    
    func recognizes(_ txt: String) -> Bool {
        return false
    }
    
    func buildEpsilonTransitionDigraph() -> AdjacencyList<Int> {
        // track metasymbols
        
        // *
            // single character closure: add undirected edge back to character preceding star
            // closure expression:
                // add undirected edge between left parenthesis and *
        
        // |
            // Do first part, skip second -> lp to right of | operator
            // Do second part, skip first right of | operator to rp
        return AdjacencyList<Int>()
    }
}
