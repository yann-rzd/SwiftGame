//
//  EnumWarriors.swift
//  SwiftGame
//
//  Created by Yann Rouzaud on 13/12/2021.
//

import Foundation

/// Here is the list of all warrior types in the game
enum EnumWarriors: CaseIterable {
    case humanWarrior
    case dwarfWarrior
    case elfWarrior
    case giantWarrior
    case wizardWarrior
    case goblinWarrior
    
    var name: String {
        switch self {
        case .humanWarrior: return "Human 👨🏻"
        case .dwarfWarrior: return "Dwarf 👨‍🔧"
        case .elfWarrior: return "Elf 🧝‍♀️"
        case .giantWarrior: return "Giant 🗿"
        case .wizardWarrior: return "Wizard 🧙‍♂️"
        case .goblinWarrior: return "Goblin 🧟‍♂️"
        }
    }
    
    var description: String {
        switch self {
        case .humanWarrior: return "Humans are great colonizers 🏃‍♂️"
        case .dwarfWarrior: return "Dwarves are strong builders 🏛"
        case .elfWarrior: return "Elves are nature spirits 🌳"
        case .giantWarrior: return "Giants are forces of nature 🏔"
        case .wizardWarrior: return "Wizards are known for their knowledge and wisdom 📚"
        case .goblinWarrior: return "Goblins are very cunning and talk a lot 👾"
        }
    }
    
    var capacity: String {
        switch self {
        case .humanWarrior: return "No particular capacity ⭕️"
        case .dwarfWarrior: return "Less life 🔴 but more attack 📈"
        case .elfWarrior: return "More life 🟢"
        case .giantWarrior: return "Cannot heal ❌ but have a formidable strength 🦾"
        case .wizardWarrior: return "Give more healing ❇️"
        case .goblinWarrior: return "More life 🟢"
        }
    }
    
    var formattedDescription: String {
        "The warrior \(name)"
              + "\n- \(description)"
              + "\n- Their capacity: \(capacity)\n"
    }
}
