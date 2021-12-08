//
//  PrintString.swift
//  SwiftGame
//
//  Created by Yann Rouzaud on 08/12/2021.
//

import Foundation


enum PrintString {
    case startGame
    
    var description: () {
        switch self {
        case .startGame:
            return print("Do you want to start a new game?")
        }
    }
}
