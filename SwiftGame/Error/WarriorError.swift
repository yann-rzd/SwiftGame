//
//  WarriorError.swift
//  SwiftGame
//
//  Created by Yann Rouzaud on 23/12/2021.
//

import Foundation

/// Here is the list of all errors in the Warrior class
enum WarriorError: Swift.Error, LocalizedError, HasFatalError {
    case failedToReadTerminal
    case inputIsNotAnInteger
    case inputIsNotOneOrTwo
    case selectedWarriorIsAlreadyDead
    case selectedWarriorTargetedIsAlreadyDead
    
    var errorDescription: String? {
        switch self {
        case .failedToReadTerminal:
            return "The terminal failed to read your request ❌"
        case .inputIsNotAnInteger:
            return "Your request is not an integer ❌"
        case .inputIsNotOneOrTwo:
            return "Your query is not 1 or 2 only ❌"
        case .selectedWarriorIsAlreadyDead:
            return "The chosen warrior is already dead ❌"
        case .selectedWarriorTargetedIsAlreadyDead:
            return "The chosen opposing warrior is already dead ❌"
        }
    }
    
    
    var isFatalError: Bool {
        self == .failedToReadTerminal
    }
}
