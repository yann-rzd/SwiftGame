//
//  DwarfWarrior.swift
//  SwiftGame
//
//  Created by Yann Rouzaud on 13/12/2021.
//

import Foundation

class DwarfWarrior: Warrior {
    
    let warriorType = "Dwarf 👨‍🔧"
    let description = "Dwarves are strong builders 🏛"
    let capacity = "Less life 🔴 but more attack 📈"
    
    override var lifeRange : ClosedRange<Int> {
        get {
            return 1...3
        }
        set {
            // nothing
        }
    }
    
    override var currentLife: Int {
        get {
            return 3
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
            warrior.currentLife = warrior.currentLife - weapon.damagePerHit - 5
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
            warrior.currentLife = warrior.currentLife - trunkOpened.damagePerHit - 5
            if warrior.currentLife <= lifeRange.lowerBound {
                warrior.currentLife = lifeRange.lowerBound
                warrior.isAlive = false
                print("This warrior is dead 💀")
            }
        }
    }
}
