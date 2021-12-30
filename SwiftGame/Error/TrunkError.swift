//
//  WarriorTypeError.swift
//  SwiftGame
//
//  Created by Yann Rouzaud on 23/12/2021.
//

import Foundation

enum TrunkError: Swift.Error, LocalizedError {
    case noWeaponAreListedInTheGame
    
    var errorDescription: String? {
        switch self {
        case .noWeaponAreListedInTheGame:
            return "There are no weapons in the game ❌"
        }
    }
}
