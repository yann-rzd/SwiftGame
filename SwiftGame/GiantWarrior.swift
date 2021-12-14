//
//  GiantWarrior.swift
//  SwiftGame
//
//  Created by Yann Rouzaud on 13/12/2021.
//

import Foundation

class GiantWarrior: Warrior {
    
    let warriorType = "Giant 🗿"
    let description = "Giants are forces of nature 🏔"
    let capacity = "Cannot heal ❌ but have a formidable strength 🦾"
    
    override var healAmountOfLife: Int {
        get {
            return 0
        }
        set {
            // nothing
        }
    }
    
    func describeWarrior() {
        print("This warrior is a \(warriorType)\n"
              + "\n\(description)"
              + "\nTheir capacity: \(capacity)")
    }
    
    override func displayInformation() {
        print("Type of warrior: \(warriorType)")
        print("\(name)'s life = \(currentLife)")
        print("\(name)'s weapon = \(weapon.description)\n")
    }
    
    override func attack(warrior: Warrior) throws {
        let randomInt = Int.random(in: 1...100)
        
        guard isAlive == true else {
            throw Error.selectedWarriorIsAlreadyDead
        }
        
        guard warrior.isAlive == true else {
            throw Error.selectedWarriorTargetedIsAlreadyDead
        }
        
        if randomInt < 90 {
            warrior.currentLife = warrior.currentLife - weapon.damagePerHit - 10
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
            warrior.currentLife = warrior.currentLife - trunkOpened.damagePerHit - 10
            if warrior.currentLife <= lifeRange.lowerBound {
                warrior.currentLife = lifeRange.lowerBound
                warrior.isAlive = false
                print("This warrior is dead 💀")
            }
        }
    }
    
    override func heal(warrior: Warrior) throws {
        
        guard isAlive == true else {
            throw Error.selectedWarriorIsAlreadyDead
        }
        
        guard warrior.isAlive == true else {
            throw Error.selectedWarriorTargetedIsAlreadyDead
        }
    
        print("Your warrior is a giant so he is unable to heal ❌")
    }
}
