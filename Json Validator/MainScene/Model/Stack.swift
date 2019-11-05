//
//  Stack.swift
//  Json Validator
//
//  Created by zupper on 04/11/19.
//  Copyright © 2019 Risonaldo. All rights reserved.
//

import UIKit

struct Stack {
    init(){}
    var stack: [String] = []
    
    func top() -> String {
        if let last = stack.last {
            return last
        } else {
            return ""
        }
    }
    
    mutating func push(characterToAppendInStack: String) {
        stack.append(characterToAppendInStack)
    }
    
    mutating func pop() {
        stack.popLast()
    }
    
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
}
