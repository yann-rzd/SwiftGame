//
//  Error.swift
//  SwiftGame
//
//  Created by Yann Rouzaud on 08/12/2021.
//

import Foundation


enum Error: Swift.Error {
    case failedToReadTerminal
    case failedToConvertTerminalInputToInteger
    case failedToAccessElementDueToIndexOutOfBounds
    case failedToCreateNameDueToWrongFormat
    case faildeToCreateNameDueToDuplication
    case failedToNameTheWarrior
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
            return "The element is not accessible because the index is out of bouds ❌"
        case .failedToCreateNameDueToWrongFormat:
            return "The name could not be created because the format is not respected ❌"
        case .faildeToCreateNameDueToDuplication:
            return "The name could not be created because it already exists ❌"
        case .failedToNameTheWarrior:
            return "The name of the warrior could not be created ❌"
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
