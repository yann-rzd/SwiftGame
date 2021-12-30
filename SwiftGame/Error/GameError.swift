//
//  Error.swift
//  SwiftGame
//
//  Created by Yann Rouzaud on 08/12/2021.
//

import Foundation

/// Here is the list of all errors in the Game class
enum GameError: Swift.Error, LocalizedError, HasFatalError {
    
    
    case failedToReadTerminal
    case failedToConvertTerminalInputToInteger
    case failedToAccessElementDueToIndexOutOfBounds
    case failedToCreateNameDueToWrongFormat
    case faildeToCreateNameDueToDuplication
    case failedIsNotOneAndTwo
    
    var errorDescription: String? {
        switch self {
        case .failedToReadTerminal:
            return "The terminal failed to read your request ❌"
        case .failedToConvertTerminalInputToInteger:
            return "Your request could not be converted to an integer ❌"
        case .failedToAccessElementDueToIndexOutOfBounds:
            return "The element is not accessible because you have filled in an element that does not exist ❌"
        case .failedToCreateNameDueToWrongFormat:
            return "The name could not be created because the format is not respected ❌"
        case .faildeToCreateNameDueToDuplication:
            return "The name could not be created because it already exists ❌"
        case .failedIsNotOneAndTwo:
            return "failedIsNotOneAndTwo"
        }
    }
    
    
    var isFatalError: Bool {
        self == .failedToReadTerminal
    }
}
