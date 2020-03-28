//
//  MazeGraph.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/24/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

/*
 Vertex = intersection
 Edge = passage
 Goal: Explore every intersection in the maze
 (Hint: DFS)
 
 Try it on the PacMan maze
 
 Tremaux maze exploration
 
 // Correctness proof. Performance proof.
 
 Questions:
 What does it mean to "back up" in a recursive algorithm?
 - Every recursive call corresponds to an edge on a graph
 - To go up one in the stacktrace, AKA just don't make a recursive call
 How does it no go to the same place twice?
 */

