//
//  ProcessJsonNew.swift
//  Json Validator
//
//  Created by zupper on 04/11/19.
//  Copyright © 2019 Risonaldo. All rights reserved.
//

import UIKit

struct Validate {
    
    init(){}
    
    private let charactersOpen = "[{"
    private let charactersClose = "}]"
    
    func initializeValidate(fromTextField: String) -> Bool {
        let stringArray = Array(removeBarsAndSpaceInString(stringToReplace: fromTextField))
        var stackModel = Stack()
        for character in stringArray {
            if(charactersOpen.contains(character)) {
                stackModel.push(characterToAppendInStack: String(character))
            } else if (charactersClose.contains(character) && stackModel.isEmpty()) {
                return false
            } else if (charactersClose.contains(character) &&
                verifyIfElementIsInverseFromTop(characterToCompare: String(character), characterFromTop: stackModel.top())) {
                stackModel.pop()
            }
        }
        if (stackModel.isEmpty()) {
            return true
        } else {
            return false
        }
    }
    
    private func removeBarsAndSpaceInString(stringToReplace: String) -> String {
        let string = stringToReplace.replacingOccurrences(of: "\\", with: "", options: NSString.CompareOptions.literal, range: nil)
        return string.replacingOccurrences(of: " ", with: "", options: NSString.CompareOptions.literal, range: nil)
    }
    
    private func verifyIfElementIsInverseFromTop(characterToCompare: String, characterFromTop: String) -> Bool {
        switch characterToCompare {
        case "[":
            return characterFromTop.contains("]")
        case "]":
            return characterFromTop.contains("[")
        case "{":
            return characterFromTop.contains("}")
        case "}":
            return characterFromTop.contains("{")
        default:
            return false
        }
    }
}

