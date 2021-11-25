//
//  Weapon.swift
//  Projet3
//
//  Created by Yann Rouzaud on 24/11/2021.
//

import Foundation

enum Weapon: CaseIterable {
    case sword
    case crossbow
    case magicWand
    case hammer
    case shotgun
    case riffle
    case shuriken
    case javelin
    case bow
    case knife
    case flamethrower
    case stick
    

    
    var formattedName: String {
        switch self {
        case .sword: return "The Sword"
        case .crossbow: return "The Crossbow"
        case .magicWand: return  "The Magic Wand"
        case .hammer: return "The Hammmer"
        case .shotgun: return "The Shotgun"
        case .riffle: return "The Riffle"
        case .shuriken: return "The Shuriken"
        case .javelin: return "The Javelin"
        case .bow: return "The Bow"
        case .knife: return "The Knife"
        case .flamethrower: return "The flamethrower"
        case .stick: return "The Stick"
        }
    }
    
    var damagePerHit: Int {
        switch self {
        case .sword: return 25
        case .crossbow: return 10
        case .magicWand: return 25
        case .hammer: return 30
        case .shotgun: return 35
        case .riffle: return 25
        case .shuriken: return 10
        case .javelin: return 20
        case .bow: return 5
        case .knife: return 5
        case .flamethrower: return 25
        case .stick: return 2
        }
    }
    
    var emoji: String {
        switch self {
        case .sword: return "🗡"
        case .crossbow: return "⚡️"
        case .magicWand: return "🪄"
        case .hammer: return "🔨"
        case .shotgun: return "🔫"
        case .riffle: return "💥"
        case .shuriken: return "🩸"
        case .javelin: return "💫"
        case .bow: return "🛡"
        case .knife: return "🔪"
        case .flamethrower: return "🔥"
        case .stick: return "🦯"
        }
    }
    
    var description: String {
        "\(formattedName) \(emoji)"
    }
}
