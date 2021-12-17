//
//  GiantWarrior.swift
//  SwiftGame
//
//  Created by Yann Rouzaud on 13/12/2021.
//

import Foundation

class GiantWarrior: Warrior {
    
    override var warriorType: String { "Giant 🗿" }
    override var description: String { "Giants are forces of nature 🏔" }
    override var capacity: String { "Cannot heal ❌ but have a formidable strength 🦾" }
    override var rawStrength: Int { 10 }
    override var healAmountOfLife: Int { 0 }
    
    
    /// This function forbids to heal
    /// - parameter warrior: The warrior targeted
    /// - throws: My warrior is already dead or the targeted warrior is already dead
    override func heal(warrior: Warrior) throws {
        
        try super.heal(warrior: warrior)
        print("Your warrior is a giant so he is unable to heal ❌")
    }
}
