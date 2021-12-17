//
//  Warrior.swift
//  Projet3
//
//  Created by Yann Rouzaud on 24/11/2021.
//

import Foundation

class Warrior {
    
    // MARK: - PUBLIC: properties
    
    let name: String
    var warriorType: String { "" }
    var description: String { "" }
    var capacity: String { "" }
    var lifeRange: ClosedRange<Int> { 0...5 }
    lazy var currentLife = lifeRange.upperBound
    var isAlive = true
    var weapon: Weapon
    var basicStrength: Int { 0 }
    var healAmountOfLife: Int { 15 }
    
    init(name: String, weapon: Weapon) {
        self.name = name
        self.weapon = weapon
    }
    
    
    // MARK: - PUBLIC: methods
    
    /// This function displays the warrior's information
    func displayInformation() {
        print("Type of warrior: \(warriorType)")
        print("\(name)'s life = \(currentLife)")
        print("\(name)'s weapon = \(weapon.description)\n")
    }
    
    
    /// This function allows the warrior to play his turn (attack or heal)
    /// - parameter targetWarrior: The warrior targeted
    /// - throws: The user didn't press 1 or 2
    func performWarriorAction(targetWarrior: Warrior) throws {
        print("Do you want to attack ⚔️ or heal 🩹? (press 1 for attack, 2 for heal")
        
        while true {
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
                try attack(warrior: targetWarrior)
                
            } else if number == 2 {
                print("Your warrior heal 🩹")
                try heal(warrior: targetWarrior)
            }
        }
    }
    
    
    /// This function allows the warrior to attack another warrior
    /// - parameter warrior: The warrior targeted
    /// - throws: My warrior is already dead or the targeted warrior is already dead
    /// - note: There is a 10% chance that a trunk will open
    func attack(warrior: Warrior) throws {
        let randomInt = Int.random(in: 1...100)
        
        while true {
            guard isAlive == true else {
                throw Error.selectedWarriorIsAlreadyDead
            }
            
            guard warrior.isAlive == true else {
                throw Error.selectedWarriorTargetedIsAlreadyDead
            }
            
            if randomInt < 90 {
                warrior.currentLife = warrior.currentLife - weapon.damagePerHit - basicStrength
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
                warrior.currentLife = warrior.currentLife - trunkOpened.damagePerHit - basicStrength
                if warrior.currentLife <= lifeRange.lowerBound {
                    warrior.currentLife = lifeRange.lowerBound
                    warrior.isAlive = false
                    print("This warrior is dead 💀")
                }
            }
        }
    }
    
    
    /// This function allows the warrior to heal another warrior
    /// - parameter warrior: The warrior targeted.
    /// - throws: My warrior is already dead or the targeted warrior is already dead
    func heal(warrior: Warrior) throws {
        
        while true {
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
}
