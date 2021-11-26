//
//  Player.swift
//  Projet3
//
//  Created by Yann Rouzaud on 24/11/2021.
//

import Foundation

class Player {
    let name: String
    var isEliminated = false
    var team = [Warrior]()
    
    init(name: String) {
        self.name = name
    }
    
    // Choisir le guerrier qui faire l'action
    private func chooseMyWarrior(warriorIndex: Int) {
        
    }
    
    // Choisir le joueur cible
    private func chooseTargetPlayer(playerIndex: Int) {
        
    }
    
    // Choisir le guerrier cible
    private func chooseTargetWarrior(warriorIndex: Int) {
        
    }
    
    // Jouer son tour
    func playTurn(players: [Player]) {
        
    }
    
    // Afficher l'état de son équipe
    func displayTeam() {
        
    }
}
