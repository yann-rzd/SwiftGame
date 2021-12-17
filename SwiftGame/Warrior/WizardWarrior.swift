//
//  WizardWarrior.swift
//  SwiftGame
//
//  Created by Yann Rouzaud on 13/12/2021.
//

import Foundation

class WizardWarrior: Warrior {
    
    override var warriorType: String { "Wizard 🧙‍♂️" }
    override var description: String { "Wizards are known for their knowledge and wisdom 📚" }
    override var capacity: String { "Give more healing ❇️" }
    override var healAmountOfLife: Int { 25 }

}
