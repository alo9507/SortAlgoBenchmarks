//
//  nTree.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

public func printTree(_ rs: [Relation]) {
    var childrenOf: [String: [String]] = [:]
    
    var allChildren = Set<String>()
    for relation in rs {
        childrenOf[relation.parent, default: []].append(relation.child)
        allChildren.insert(relation.child)
    }
    
    var root: String = ""
    for (key, _) in childrenOf {
        if !allChildren.contains(key) { root = key; break }
    }
    
    dfs(root, 0, childrenOf)
}

public func dfs(_ root: String, _ level: Int, _ childrenOf: [String: [String]]) {
    for i in stride(from: 0, through: level, by: 1) {
        print("\t", terminator: "")
    }
    print(root)
    
    guard let children = childrenOf[root] else {
        return
    }
    
    for child in children {
        dfs(child, level+1, childrenOf)
    }
    
}

public class Relation {
    var parent: String
    var child: String
    
    init(parent: String, child: String) {
        self.parent = parent
        self.child = child
    }
}
