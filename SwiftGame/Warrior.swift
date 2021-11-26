//
//  Warrior.swift
//  Projet3
//
//  Created by Yann Rouzaud on 24/11/2021.
//

import Foundation

class Warrior {
    let name: String
    let maxLife = 100
    var currentLife = 100 // Faire une propriété calculée
    var isAlive = true // Faire une propriété calculée
    var weapon: Weapon
    
    init(name: String, weapon: Weapon) {
        self.name = name
        self.weapon = weapon
    }
    
    // Attaquer
    func attack() {
        
    }
    
    // Soigner
    func heal() {
        
    }
    
    // Afficher les informations du guerrier
    func displayInformation() {
        
    }
}
