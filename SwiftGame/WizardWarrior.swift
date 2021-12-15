//
//  WizardWarrior.swift
//  SwiftGame
//
//  Created by Yann Rouzaud on 13/12/2021.
//

import Foundation

class WizardWarrior: Warrior {
    
    private let warriorType = "Wizard 🧙‍♂️"
    private let description = "Wizards are known for their knowledge and wisdom 📚"
    private let capacity = "Give more healing ❇️"
    
    override var healAmountOfLife: Int {
        get {
            return 25
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
}
