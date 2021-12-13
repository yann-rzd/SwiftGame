//
//  EnumWarriors.swift
//  SwiftGame
//
//  Created by Yann Rouzaud on 13/12/2021.
//

import Foundation

enum EnumWarriors: CaseIterable {
    case human
    case dwarf
    case elf
    case giant
    case wizard
    case goblin
    
    var warriorType: String {
        switch self {
        case .human: return "Human 👨🏻"
        case .dwarf: return "Dwarf 👨‍🔧"
        case .elf: return "Elf 🧝‍♀️"
        case .giant: return "Giant 🗿"
        case .wizard: return "Wizard 🧙‍♂️"
        case .goblin: return "Goblin 🧟‍♂️"
        }
    }
    
    var description: String {
        switch self {
        case .human: return "Humans are great colonizers 🏃‍♂️"
        case .dwarf: return "Dwarves are strong builders 🏛"
        case .elf: return "Elves are nature spirits 🌳"
        case .giant: return "Giants are forces of nature 🏔"
        case .wizard: return "Wizards are known for their knowledge and wisdom 📚"
        case .goblin: return "Goblins are very cunning and talk a lot 👾"
        }
    }
    
    var capacity: String {
        switch self {
        case .human: return "No particular capacity ⭕️"
        case .dwarf: return "Less life 🔴 but more attack 📈"
        case .elf: return "More life 🟢"
        case .giant: return "Cannot heal ❌ but have a formidable strength 🦾"
        case .wizard: return "Give more healing ❇️"
        case .goblin: return "More life 🟢"
        }
    }
    
    var formattedDescription: String {
        "This warrior is a \(warriorType)\n"
              + "\n\(description)"
              + "\nTheir capacity: \(capacity)"
    }
}
