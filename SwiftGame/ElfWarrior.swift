//
//  ElfWarrior.swift
//  SwiftGame
//
//  Created by Yann Rouzaud on 13/12/2021.
//

import Foundation

class ElfWarrior: Warrior {
    
    let warriorType = "Elf 🧝‍♀️"
    let description = "Elves are nature spirits 🌳"
    let capacity = "More life 🟢"
    
    func describeWarrior() {
        print("This warrior is an \(warriorType)\n"
              + "\n\(description)"
              + "/nTheir capacity: \(capacity)")
    }
    
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
}
