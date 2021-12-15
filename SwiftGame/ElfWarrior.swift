//
//  ElfWarrior.swift
//  SwiftGame
//
//  Created by Yann Rouzaud on 13/12/2021.
//

import Foundation

class ElfWarrior: Warrior {
    
    private let warriorType = "Elf 🧝‍♀️"
    private let description = "Elves are nature spirits 🌳"
    private let capacity = "More life 🟢"
    
    override var lifeRange : ClosedRange<Int> {
        get {
            return 1...10
        }
        set {
            // nothing
        }
    }
    
    override var currentLife: Int {
        get {
            return 10
        }
        set {
            // nothing
        }
    }
    
    /// This function describes the warrior
    func describeWarrior() {
        print("This warrior is an \(warriorType)\n"
              + "\n\(description)"
              + "\nTheir capacity: \(capacity)")
    }
    
    /// This function displays the information of the warrior
    override func displayInformation() {
        print("Type of warrior: \(warriorType)")
        print("\(name)'s life = \(currentLife)")
        print("\(name)'s weapon = \(weapon.description)\n")
    }
}
