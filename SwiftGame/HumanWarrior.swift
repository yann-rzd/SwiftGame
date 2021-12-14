//
//  HumanWarrior.swift
//  SwiftGame
//
//  Created by Yann Rouzaud on 13/12/2021.
//

import Foundation

class HumanWarrior: Warrior {
    
    let warriorType = "Human 👨🏻"
    let description = "Humans are great colonizers 🏃‍♂️"
    let capacity = "No particular capacity ⭕️"
    
    func describeWarrior() {
        print("This warrior is a \(warriorType)\n"
              + "\n\(description)"
              + "\nTheir capacity: \(capacity)")
    }
}
