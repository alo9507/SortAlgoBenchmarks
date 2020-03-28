//
//  KnuthMorrisPratt.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/23/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// introducing state to a brute force algorithm is often a good method for reducing its worst case complexity

// transition table for the DFA is just a 2d array indexed by the pattern character

// Text pointer i never has to decrement (backup)

// Match transitions and mismatch transitions
