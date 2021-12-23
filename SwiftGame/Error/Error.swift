//
//  Error.swift
//  SwiftGame
//
//  Created by Yann Rouzaud on 08/12/2021.
//

import Foundation

/// Here is the list of all errors in the game
enum Error: Swift.Error {
    case failedToReadTerminal
    case failedToConvertTerminalInputToInteger
    case failedToAccessElementDueToIndexOutOfBounds
    case failedToCreateNameDueToWrongFormat
    case faildeToCreateNameDueToDuplication
    case failedToNameTheWarrior
    case failedToAssignWeapon
    case inputIsNotAnInteger
    case inputIsNotOneOrTwo
    case selectedWarriorIsAlreadyDead
    case selectedWarriorTargetedIsAlreadyDead
    case selectedPlayerIsAlreadyDead
    
    var description: String {
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
        case .failedToNameTheWarrior:
            return "The name of the warrior could not be created ❌"
        case .failedToAssignWeapon:
            return "The weapon could not be assigned to the warrior ❌"
        case .inputIsNotAnInteger:
            return "Your request is not an integer ❌"
        case .inputIsNotOneOrTwo:
            return "Your query is not 1 or 2 only ❌"
        case .selectedWarriorIsAlreadyDead:
            return "The chosen warrior is already dead ❌"
        case .selectedWarriorTargetedIsAlreadyDead:
            return "The chosen opposing warrior is already dead ❌"
        case .selectedPlayerIsAlreadyDead:
            return "The chosen player is already dead ❌"
        }
    }
}
