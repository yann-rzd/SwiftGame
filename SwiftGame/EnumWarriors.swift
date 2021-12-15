//
//  EnumWarriors.swift
//  SwiftGame
//
//  Created by Yann Rouzaud on 13/12/2021.
//

import Foundation

/// Here is the list of all warrior types in the game
enum EnumWarriors: CaseIterable {
    case HumanWarrior
    case DwarfWarrior
    case ElfWarrior
    case GiantWarrior
    case WizardWarrior
    case GoblinWarrior
    
    var name: String {
        switch self {
        case .HumanWarrior: return "Human 👨🏻"
        case .DwarfWarrior: return "Dwarf 👨‍🔧"
        case .ElfWarrior: return "Elf 🧝‍♀️"
        case .GiantWarrior: return "Giant 🗿"
        case .WizardWarrior: return "Wizard 🧙‍♂️"
        case .GoblinWarrior: return "Goblin 🧟‍♂️"
        }
    }
    
    var description: String {
        switch self {
        case .HumanWarrior: return "Humans are great colonizers 🏃‍♂️"
        case .DwarfWarrior: return "Dwarves are strong builders 🏛"
        case .ElfWarrior: return "Elves are nature spirits 🌳"
        case .GiantWarrior: return "Giants are forces of nature 🏔"
        case .WizardWarrior: return "Wizards are known for their knowledge and wisdom 📚"
        case .GoblinWarrior: return "Goblins are very cunning and talk a lot 👾"
        }
    }
    
    var capacity: String {
        switch self {
        case .HumanWarrior: return "No particular capacity ⭕️"
        case .DwarfWarrior: return "Less life 🔴 but more attack 📈"
        case .ElfWarrior: return "More life 🟢"
        case .GiantWarrior: return "Cannot heal ❌ but have a formidable strength 🦾"
        case .WizardWarrior: return "Give more healing ❇️"
        case .GoblinWarrior: return "More life 🟢"
        }
    }
    
    var formattedDescription: String {
        "The warrior \(name)"
              + "\n- \(description)"
              + "\n- Their capacity: \(capacity)\n"
    }
}
