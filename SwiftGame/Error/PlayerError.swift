//
//  PlayerError.swift
//  SwiftGame
//
//  Created by Yann Rouzaud on 23/12/2021.
//

import Foundation

/// Here is the list of all errors in the Player class
enum PlayerError: Swift.Error, LocalizedError, HasFatalError {
    case failedToReadTerminal
    case failedToConvertTerminalInputToInteger
    case inputIsNotAnInteger
    case inputIsNotOneOrTwo
    case selectedWarriorIsAlreadyDead
    case selectedPlayerIsAlreadyDead
    
    var errorDescription: String? {
        switch self {
        case .failedToReadTerminal:
            return "The terminal failed to read your request ❌"
        case .failedToConvertTerminalInputToInteger:
            return "Your request could not be converted to an integer ❌"
        case .inputIsNotAnInteger:
            return "Your request is not an integer ❌"
        case .inputIsNotOneOrTwo:
            return "Your query is not 1 or 2 only ❌"
        case .selectedWarriorIsAlreadyDead:
            return "The chosen warrior is already dead ❌"
        case .selectedPlayerIsAlreadyDead:
            return "The chosen player is already dead ❌"
        }
    }
    
    var isFatalError: Bool {
        self == .failedToReadTerminal
    }
}
