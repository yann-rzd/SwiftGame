//
//  Trunk.swift
//  Projet3
//
//  Created by Yann Rouzaud on 24/11/2021.
//

import Foundation

class Trunk {
    
    // Ouvrir la caisse
    func open() -> Weapon {
        let weapon: Weapon
        weapon = Weapon.allCases.randomElement()!
        
        return weapon
    }
}
