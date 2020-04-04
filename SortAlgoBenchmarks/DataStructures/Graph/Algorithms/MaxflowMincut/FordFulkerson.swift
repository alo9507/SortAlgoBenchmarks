//
//  FordFulkerson.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/26/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// A Greedy approach can lead to dead ends and underuse of resources

// DEFINITIONS
// Flow Network: A digraph with flow F(E) + capacity C(E) capacity of Eth edge c
// Source: start vertex with in-degree 0
// Sink: end vertex with out-degree 0
// Residual Capacity: Original Capacity - Flow
// Residual Flow Network: The "undo" graph with reversed edges


// CONSTRAINTS
// Capcity: through any given edge is 0 <= F(E) <= C(E)
// Flow Conservation: The incoming flow to a vertex must match the outgoing flow from that vertex

// PROPOSITIONS
// The max flow we can push out of the start will be limited by the minimum cut we can find
// You can only ever create Flow equal to the sum of the capacities outgoing from source

// ALGORITHM
// Do a DFS to find path from source to sink
// Find bottleneck capacity, then push that much flow through network
// Augment each edge and the total capacity
// As we add flow to forward edges, we take away flow from backward edges
