//
//  HuffmanCoding.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 4/10/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

// Variable length coding: use different number of bits to encode different chars

// How to ensure no ambiguity?
// Ensure no codeword is a prefix of another
// Or have a special stop characterc

// "Prefix free" codes

// Huffman finds the codes that uses the fewest bits for that message

// Represent prefix free codes with a binary trie
// This is the encoding trie
