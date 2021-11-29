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
    var team: [Warrior] = []
    
    init(name: String) {
        self.name = name
    }
    
    // Jouer son tour
    func playTurn() {
        if newGame.isGameOver == false {
            if isEliminated == false {
                displayTeams()
                chooseMyWarrior()
                chooseTargetWarrior(playerIndex: chooseTargetPlayer()!)
            } else {
                print("You have no warriors alive 😢. So you skip your turn ❌.")
            }
        }
    }
    
    // Afficher l'état de son équipe
    func displayTeams() {
        print("Do you want to display the teams? (yes or no)")
              
        if let answer = readLine() {
            if answer == "yes" {
                for i in 0..<newGame.players.count {
                    print("This is the team of player \(i + 1), \(newGame.players[i].name):")
                    for j in 0..<team.count {
                        print("Warrior number \(j + 1) -> \(newGame.players[i].team[j].name):"
                              + "\n- \(newGame.players[i].team[j].name)'s life = \(newGame.players[i].team[j].currentLife)"
                              + "\n- \(newGame.players[i].team[j].name)'s weapon = \(newGame.players[i].team[j].weapon.description)" + "\n)")
                    }
                }
            } else if answer == "no" {
                print("So let's get down to business!")
            } else {
                print("I don't understand ❌")
            }
        }
    }
    
    // Choisir le guerrier qui faire l'action
    private func chooseMyWarrior() -> Warrior? {
        print("Which warrior do you want to attack with? (Enter the number of your warrior)")
        
        if let warrior = readLine() {
            if var warriorIndex = Int(warrior) {
                warriorIndex -= 1
                if warriorIndex <= team.count && team[warriorIndex].isAlive {
                    print("The warrior \(team[warriorIndex].name) takes action!")
                    return team[warriorIndex]
                } else {
                    print("Your must enter a number between 1 and 3 and choose a warrior still alive.")
                }
            }
        }
        return nil
    }
    
    // Choisir le joueur cible
    private func chooseTargetPlayer() -> Int? {
        print("Which player do you want to target?")
        
        if let player = readLine() {
            if var playerIndex = Int(player) {
                playerIndex -= 1
                if playerIndex <= newGame.players.count && newGame.players[playerIndex].isEliminated == false {
                    print("You choose to target player \(newGame.players[playerIndex].name)!")
                    return playerIndex
                } else {
                    print("You must select the number of a player who exists and is not yet eliminated.")
                }
            }
        }
        return nil
    }
    
    // Choisir le guerrier cible
    private func chooseTargetWarrior(playerIndex: Int) -> Warrior? {
        print("Which player \(newGame.players[playerIndex].name)'s warrior do you want to target?")
        
        if let warrior = readLine() {
            if let warriorIndex = Int(warrior) {
                if warriorIndex <= team.count && team[warriorIndex - 1].isAlive {
                    print("You choose to target the warrior \(newGame.players[playerIndex].team[warriorIndex - 1].name)!")
                    return newGame.players[playerIndex].team[warriorIndex - 1]
                } else {
                    print("You must select the number of the warrior still alive you want to target.")
                }
            }
        }
        return nil
    }
}
