//
//  DwarfWarrior.swift
//  SwiftGame
//
//  Created by Yann Rouzaud on 13/12/2021.
//

import Foundation

class DwarfWarrior: Warrior {
    
    private let warriorType = "Dwarf 👨‍🔧"
    private let description = "Dwarves are strong builders 🏛"
    private let capacity = "Less life 🔴 but more attack 📈"
    
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
    
    /// This function describes the warrior
    func describeWarrior() {
        print("This warrior is a \(warriorType)\n"
              + "\n\(description)"
              + "\nTheir capacity: \(capacity)")
    }
    
    /// This function displays the information of the warrior
    override func displayInformation() {
        print("Type of warrior: \(warriorType)")
        print("\(name)'s life = \(currentLife)")
        print("\(name)'s weapon = \(weapon.description)\n")
    }
    
    /// This function allows the warrior to attack another warrior
    /// - parameter warrior: The warrior targeted
    /// - throws: My warrior is already dead or the targeted warrior is already dead
    /// - note: The dwarf has 5 extra attack points and there is a 10% chance that a trunk will open
    override func attack(warrior: Warrior) throws {
        let randomInt = Int.random(in: 1...100)
        
        while true {
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
}
