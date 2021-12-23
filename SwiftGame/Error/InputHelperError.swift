//
//  InputHelperError.swift
//  SwiftGame
//
//  Created by Yann Rouzaud on 23/12/2021.
//

import Foundation

/// Here is the list of all errors in the Game class
enum InputHelperError: Swift.Error {
    case failedToReadTerminal
    case inputIsNotAnInteger
    case failedToAccessElementDueToIndexOutOfBounds
    
    var description: String {
        switch self {
        case .failedToReadTerminal:
            return "The terminal failed to read your request ❌"
        case .inputIsNotAnInteger:
            return "Your request is not an integer ❌"
        case .failedToAccessElementDueToIndexOutOfBounds:
            return "The element is not accessible because you have filled in an element that does not exist ❌"
        }
    }
}
