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
    func performWarriorAction(targetWarrior: Warrior) {
        print("Do you want to attack ⚔️ or heal 🩹? (press 1 for attack, 2 for heal")
        
        if let answer = readLine() {
            if let choice = Int(answer) {
                if choice == 1 {
                    print("Your warrior attack ⚔️")
                    attack(warrior: targetWarrior)
                } else if choice == 2 {
                    print("Your warrior heal 🩹")
                    heal(warrior: targetWarrior)
                } else {
                    print("I don't understand ❌")
                }
            }
        }
    }
    
    // Attaquer
    func attack(warrior: Warrior) {
        let randomInt = Int.random(in: 1...100)
        if isAlive == true && warrior.isAlive == true {
            if randomInt < 90 {
                warrior.currentLife = warrior.currentLife - weapon.damagePerHit
                
                if warrior.currentLife <= lifeRange.lowerBound {
                    warrior.currentLife = lifeRange.lowerBound
                    warrior.isAlive = false
                    print("This warrior is dead 💀")
                }
            } else {
                let trunkIsOpening = "A trunk appears! It contains a weapon... It is"
                let trunk = Trunk()
                let trunkOpened = trunk.open()
                print("\(trunkIsOpening) \(trunkOpened.description) !")
                
                warrior.currentLife = warrior.currentLife - trunkOpened.damagePerHit
                
                if warrior.currentLife <= lifeRange.lowerBound {
                    warrior.currentLife = lifeRange.lowerBound
                    warrior.isAlive = false
                    print("This warrior is dead 💀")
                }
                
            }
        } else if isAlive == true && warrior.isAlive == false {
            print("This warrior is already dead 💀")
        } else if isAlive == false {
            print("Your warrior is already dead 💀")
        }
    }
    
    // Soigner
    func heal(warrior: Warrior) {
        if isAlive == true {
            warrior.currentLife = warrior.currentLife + healAmountOfLife
            if warrior.currentLife > lifeRange.upperBound {
                warrior.currentLife = lifeRange.upperBound
            }
        } else if isAlive == true && warrior.isAlive == false {
            print("This warrior is already dead 💀")
        } else if isAlive == false {
            print("Your warrior is already dead 💀")
        }
    }
    
    // Afficher les informations du guerrier
    func displayInformation() {
        
    }
}
