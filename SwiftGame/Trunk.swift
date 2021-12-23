//
//  Trunk.swift
//  Projet3
//
//  Created by Yann Rouzaud on 24/11/2021.
//

import Foundation

class Trunk {
    
    enum Error: Swift.Error {
        case noWeaponAreListedInTheGame
    }
    
    /// This function opens a trunk with a random weapon
    func open() throws -> Weapon {
        guard let weapon = Weapon.allCases.randomElement() else {
            throw Error.noWeaponAreListedInTheGame
        }
       
        return weapon
    }
}
