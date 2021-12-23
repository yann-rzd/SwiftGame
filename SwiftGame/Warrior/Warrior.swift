//
//  Warrior.swift
//  Projet3
//
//  Created by Yann Rouzaud on 24/11/2021.
//

import Foundation

class Warrior {
    
    // MARK: - INTERNAL: properties
    
    let name: String
    var warriorType: String { "" }
    var description: String { "" }
    var capacity: String { "" }
    var lifeRange: ClosedRange<Int> { 0...5 }
    lazy var currentLife = lifeRange.upperBound
    var isAlive: Bool {
        currentLife > 0
    }
    var weapon: Weapon
    var rawStrength: Int { 0 }
    var healAmountOfLife: Int { 15 }
    
    init(name: String, weapon: Weapon) {
        self.name = name
        self.weapon = weapon
    }
    
    
    // MARK: - INTERNAL: methods
    
    /// This function allows the warrior to play his turn (attack or heal)
    /// - parameter targetWarrior: The warrior targeted
    /// - throws: The user didn't press 1 or 2
    func performWarriorAction(targetWarrior: Warrior) throws {
        print("Do you want to attack ⚔️ or heal 🩹? (press 1 for attack, 2 for heal")
        
        while true {
            guard let answer = readLine() else {
                throw WarriorError.failedToReadTerminal
            }
            
            guard let number = Int(answer) else {
                throw WarriorError.inputIsNotAnInteger
            }
            
            guard number == 1 || number == 2 else {
                throw WarriorError.inputIsNotOneOrTwo
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
        guard isAlive else {
            throw WarriorError.selectedWarriorIsAlreadyDead
        }
        
        guard warrior.isAlive else {
            throw WarriorError.selectedWarriorTargetedIsAlreadyDead
        }
        
        if let newSingleUsageWeapon = try? handleTrunkAppeareance() {
            print("A trunk appears! It contains a weapon... It is \(newSingleUsageWeapon.description) !")
            warrior.takeDamage(amount: getInflictingDamage(with: newSingleUsageWeapon))
        } else {
            warrior.takeDamage(amount: getInflictingDamage(with: self.weapon))
        }
    }
    
    
    /// This function allows the warrior to heal another warrior
    /// - parameter warrior: The warrior targeted.
    /// - throws: My warrior is already dead or the targeted warrior is already dead
    func heal(warrior: Warrior) throws {
        
        while true {
            guard isAlive == true else {
                throw WarriorError.selectedWarriorIsAlreadyDead
            }
            
            guard warrior.isAlive == true else {
                throw WarriorError.selectedWarriorTargetedIsAlreadyDead
            }
            
            warrior.currentLife = warrior.currentLife + healAmountOfLife
            if warrior.currentLife > lifeRange.upperBound {
                warrior.currentLife = lifeRange.upperBound
            }
        }
    }
    
    /// This function displays the warrior's information
    func displayInformation() {
        print("Type of warrior: \(warriorType)")
        print("\(name)'s life = \(currentLife)")
        print("\(name)'s weapon = \(weapon.description)\n")
    }
    
    
    // MARK: - PRIVATE: methods

    /// This function calculates the amount of damage inflicted
    /// - parameter weapon: The weapon used by the warrior
    /// - returns: the amount of damage inflicted
    private func getInflictingDamage(with weapon: Weapon) -> Int {
        return weapon.damagePerHit + rawStrength
    }
    
    
    /// This finction inflicts damage to the targeted warrior
    /// - parameter amount: the amount of damage inflicted calculated by getInflictingDamage function
    private func takeDamage(amount: Int) {
        currentLife -= amount
        
        if currentLife <= lifeRange.lowerBound {
            currentLife = lifeRange.lowerBound
            print("This warrior is dead 💀")
        }
    }
    
    
    /// This function makes a trunk appear
    /// - throws: If no weapons listed in the game
    /// - returns: the random weapon in the trunk
    private func handleTrunkAppeareance() throws -> Weapon? {
        guard hasFoundTrunk() else {
            return nil
        }
        
        let trunk = Trunk()
        return try? trunk.open()
    }
    
    
    /// This function determines the rate of appearance of a trunk (1/10)
    /// - returns: true if a trunk appears
    private func hasFoundTrunk() -> Bool {
        let randomInt = Int.random(in: 1...100)
        return randomInt > 90
    }
}



