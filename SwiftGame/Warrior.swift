//
//  Warrior.swift
//  Projet3
//
//  Created by Yann Rouzaud on 24/11/2021.
//

import Foundation

class Warrior {
    let name: String
    let lifeRange = 0...100
    var currentLife = 100 // Faire une propriété calculée
    var isAlive = true // Faire une propriété calculée
    var weapon: Weapon
    let healAmountOfLife = 15
    
    init(name: String, weapon: Weapon) {
        self.name = name
        self.weapon = weapon
    }
    
    //Le guerrier joue son tour
    func warriorAction() {
        print("Do you want to attack ⚔️ or heal 🩹? (press 1 for attack, 2 for heal")
        
        if let answer = readLine() {
            if let choice = Int(answer) {
                if choice == 1 {
                    print("Your warrior attack ⚔️")
                    attack(attackerWarrior: Warrior, targetedWarrior: Warrior)
                } else if choice == 2 {
                    print("Your warrior heal 🩹")
                    heal(healerWarrior: Warrior, targetedWarrior: Warrior)
                } else {
                    print("I don't understand ❌")
                }
            }
        }
    }
    
    // Attaquer
    func attack(attackerWarrior: Warrior, targetedWarrior: Warrior) { // Comment récupérer attackerWarrior et targetedWarrior ?
        if attackerWarrior.isAlive == true {
            targetedWarrior.currentLife = targetedWarrior.currentLife - attackerWarrior.weapon.damagePerHit
            
            if targetedWarrior.currentLife <= lifeRange.lowerBound {
                targetedWarrior.currentLife = lifeRange.lowerBound
                targetedWarrior.isAlive == false
                print("The warrior ... is dead 💀")
            }
        } else {
            print("This warrior is dead 💀")
        }
    }
    
    // Soigner
    func heal(healerWarrior: Warrior, targetedWarrior: Warrior) { // Comment récupérer healerWarrior et targetedWarrior ?
        if isAlive == true {
            targetedWarrior.currentLife = targetedWarrior.currentLife + healAmountOfLife
            if targetedWarrior.currentLife > lifeRange.upperBound {
                targetedWarrior.currentLife = lifeRange.upperBound
            }
        } else {
            print("This warrior is already out 💀")
        }
    }
    
    // Afficher les informations du guerrier
    func displayInformation() {
        
    }
}
