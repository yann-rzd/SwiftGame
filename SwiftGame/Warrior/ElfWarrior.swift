//
//  ElfWarrior.swift
//  SwiftGame
//
//  Created by Yann Rouzaud on 13/12/2021.
//

import Foundation

class ElfWarrior: Warrior {
    
    override var warriorType: String { "Elf 🧝‍♀️" }
    override var description: String { "Elves are nature spirits 🌳" }
    override var capacity: String { "More life 🟢" }
    override var lifeRange: ClosedRange<Int> { 0...10 }
    
}
