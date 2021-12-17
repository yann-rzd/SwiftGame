//
//  DwarfWarrior.swift
//  SwiftGame
//
//  Created by Yann Rouzaud on 13/12/2021.
//

import Foundation

class DwarfWarrior: Warrior {
    
    override var warriorType: String { "Dwarf 👨‍🔧" }
    override var description: String { "Dwarves are strong builders 🏛" }
    override var capacity: String { "Less life 🔴 but more attack 📈" }
    override var lifeRange: ClosedRange<Int> { 0...3 }
    override var basicStrength: Int { 5 }
    
}
