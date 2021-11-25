//
//  Warrior.swift
//  Projet3
//
//  Created by Yann Rouzaud on 24/11/2021.
//

import Foundation

class Warrior {
    var name: String
    var life = 100
    var weapon: Weapon
    
    init(name: String, weapon: Weapon) {
        self.name = name
        self.weapon = weapon
    }
    
    // Attaquer
    func attack() {
        
    }
    
    // Soigner
    func treat() {
        
    }
}
