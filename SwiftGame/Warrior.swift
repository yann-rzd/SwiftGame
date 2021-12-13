//
//  Warrior.swift
//  Projet3
//
//  Created by Yann Rouzaud on 24/11/2021.
//

import Foundation

class Warrior {
    let name: String
    var lifeRange = 0...5
    var currentLife = 5 // Faire une propriété calculée
    var isAlive = true // Faire une propriété calculée
    var weapon: Weapon
    var healAmountOfLife = 15
    
    init(name: String, weapon: Weapon) {
        self.name = name
        self.weapon = weapon
    }
    
    //Le guerrier joue son tour
    func performWarriorAction(targetWarrior: Warrior) throws {
        print("Do you want to attack ⚔️ or heal 🩹? (press 1 for attack, 2 for heal")
        
        guard let answer = readLine() else {
            throw Error.failedToReadTerminal
        }
        
        guard let number = Int(answer) else {
            throw Error.inputIsNotAnInteger
        }
        
        guard number == 1 || number == 2 else {
            throw Error.inputIsNotOneOrTwo
        }

        if number == 1 {
            print("Your warrior attack ⚔️")
            try? attack(warrior: targetWarrior)
            
        } else if number == 2 {
            print("Your warrior heal 🩹")
            try? heal(warrior: targetWarrior)
        }
    }
    
    
    // Afficher les informations du guerrier
    func displayInformation() {
        print("\(name)'s life = \(currentLife)")
        print("\(name)'s weapon = \(weapon.description)\n")

    }
    
    // Attaquer
    func attack(warrior: Warrior) throws {
        let randomInt = Int.random(in: 1...100)
        
        guard isAlive == true else {
            throw Error.selectedWarriorIsAlreadyDead
        }
        
        guard warrior.isAlive == true else {
            throw Error.selectedWarriorTargetedIsAlreadyDead
        }
        
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
    }
    
    // Soigner
    func heal(warrior: Warrior) throws {
        
        guard isAlive == true else {
            throw Error.selectedWarriorIsAlreadyDead
        }
        
        guard warrior.isAlive == true else {
            throw Error.selectedWarriorTargetedIsAlreadyDead
        }
        

        warrior.currentLife = warrior.currentLife + healAmountOfLife
        if warrior.currentLife > lifeRange.upperBound {
            warrior.currentLife = lifeRange.upperBound
        }
    }
}
