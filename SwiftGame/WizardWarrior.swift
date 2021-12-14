//
//  WizardWarrior.swift
//  SwiftGame
//
//  Created by Yann Rouzaud on 13/12/2021.
//

import Foundation

class WizardWarrior: Warrior {
    
    let warriorType = "Wizard 🧙‍♂️"
    let description = "Wizards are known for their knowledge and wisdom 📚"
    let capacity = "Give more healing ❇️"
    
    override var healAmountOfLife: Int {
        get {
            return 25
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
}
