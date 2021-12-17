//
//  GoblinWarrior.swift
//  SwiftGame
//
//  Created by Yann Rouzaud on 13/12/2021.
//

import Foundation

class GoblinWarrior: Warrior {
    
    override var warriorType: String { "Goblin 🧟‍♂️" }
    override var description: String { "Goblins are very cunning and talk a lot 👾" }
    override var capacity: String { "More life 🟢" }
    override var lifeRange: ClosedRange<Int> { 0...10 }
    
}
