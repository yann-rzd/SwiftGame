//
//  Player.swift
//  Projet3
//
//  Created by Yann Rouzaud on 24/11/2021.
//

import Foundation

class Player {
    
    // MARK: PUBLIC: properties
    
    let name: String
    
    var isEliminated: Bool {
        !team.contains { $0.isAlive }
    }
    
    var team: [Warrior] = []
    
    init(name: String) {
        self.name = name
    }
    
    
    // MARK: PUBLIC: methods
    
    /// This feature allows the player to play when it is his turn
    /// - parameter players: The array with all the players.
    func playTurn(players: [Player]) {
        guard !isEliminated else {
            print("You have no warriors alive 😢. So you skip your turn ❌.")
            return
        }
        
        loopChooseDisplayTeams(players: players)
        
        let targetPlayer = loopChoosePlayer(from: players)    
        let warriorMakingAction = loopChooseWarrior(from: self)
        let targetWarrior = loopChooseWarrior(from: targetPlayer)
        
        try? warriorMakingAction.performWarriorAction(targetWarrior: targetWarrior)
    }
    
    
    /// This function displays the team status of all players
    /// - parameter players: the array with all the players.
    func displayTeams(players: [Player]) throws {
        print("Do you want to display the teams? (print 1 for yes, 2 for no)")
        
        guard let answer = readLine() else {
            throw Error.failedToReadTerminal
        }
        
        guard let number = Int(answer) else {
            throw Error.inputIsNotAnInteger
        }
        
        guard number == 1 || number == 2 else {
            throw Error.inputIsNotOneOrTwo
        }
              
        if number == 1 {
            for (index, player) in players.enumerated() {
                print("This is the team of player \(index + 1), \(player.name):\n")
                player.displayOwnTeam()
            }
        } else if number == 2 {
            print("So let's get down to business!\n")
        }
    }
    
    
    /// This function displays the team status
    func displayOwnTeam() {
        for (index, warrior) in team.enumerated() {
            print("\(index + 1). Warrior named \(warrior.name) --------------------------------")
            warrior.displayInformation()
        }
    }
    
    
    /// This function checks if the name of a warrior is already in use
    /// - parameter name: The name we want to give to our warrior
    /// - returns: true or false
    func getHasWarriorInTeamWithSameName(name: String) -> Bool {
        team.contains {
            $0.name.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == name.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    
    
    // MARK: PRIVATE: methods
    
    #warning("Commenter la fonction")
    private let inputHelper = InputHelper.shared
    
    #warning("Commenter la fonction")
    private func loopChooseDisplayTeams(players: [Player]) {
        inputHelper.loopAction(action: { try displayTeams(players: players) })
    }
    
    #warning("Commenter la fonction")
    private func loopChooseWarrior(from player: Player) -> Warrior {
        inputHelper.loopAction(action: { try chooseWarrior(from: player) })
    }
    
    #warning("Commenter la fonction")
    private func loopChoosePlayer(from players: [Player]) -> Player {
        inputHelper.loopAction(action: { try choosePlayer(from: players) })
    }
    
    /// This function allows you to choose the warrior who will perform the action
    /// - parameter player: the player targeted
    /// - throws: selected warrior is already dead
    /// - returns: the warrior chosen
    private func chooseWarrior(from player: Player) throws -> Warrior {
        print("Which warrior do you want to choose from \(player.name)? (Enter the number of the warrior)")
        
        let selectedWarrior = try inputHelper.chooseElement(from: player.team)
        
        guard selectedWarrior.isAlive else {
            throw Error.selectedWarriorIsAlreadyDead
        }
        
        print("The warrior \(selectedWarrior.name) takes action!")
        
        return selectedWarrior
    }
    
    
    /// This function allows you to choose the player who will be affected by the action
    /// - parameter players: the array with all the players
    /// - throws: selected player is already dead
    /// - returns: the player selected
    private func choosePlayer(from players: [Player]) throws -> Player {
        print("Which player do you want to target ? (Enter the number of the player)")
        
        let selectedPlayer = try inputHelper.chooseElement(from: players)
        
        guard !selectedPlayer.isEliminated else {
            throw Error.selectedPlayerIsAlreadyDead
        }
        
        print("You chose to target \(selectedPlayer.name)!")
        
        return selectedPlayer
    }
}
