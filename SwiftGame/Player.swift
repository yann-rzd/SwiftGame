//
//  Player.swift
//  Projet3
//
//  Created by Yann Rouzaud on 24/11/2021.
//

import Foundation

final class Player {
    
    // MARK: -INTERNAL: properties
    
    let name: String
    
    var isEliminated: Bool {
        !team.contains { $0.isAlive }
    }
    
    var team: [Warrior] = []
    
    init(name: String) {
        self.name = name
    }
    
    
    // MARK: -INTERNAL: methods
    
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
        
        loopChooseWarriorActionToPerform(warriorMakingAction: warriorMakingAction, targetWarrior: targetWarrior)
    }
    
    
    /// This function displays the team status of all players
    /// - parameter players: the array with all the players.
    func displayTeams(players: [Player]) throws {
        print("Do you want to display the teams? (print 1 for yes, 2 for no)")
        
        guard let answer = readLine() else {
            throw PlayerError.failedToReadTerminal
        }
        
        guard let number = Int(answer) else {
            throw PlayerError.inputIsNotAnInteger
        }
        
        switch number {
        case 1:
            for (index, player) in players.enumerated() {
                print("This is the team of player \(index + 1), \(player.name):\n")
                player.displayOwnTeam()
            }
        case 2:
            print("So let's get down to business!\n")
        default:
            throw PlayerError.inputIsNotOneOrTwo
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

    
    // MARK: -PRIVATE: properties
    
    /// Get the functions of the InputHelper class
    private let inputHelper = InputHelper.shared
    
    
    // MARK: -PRIVATE: methods
    
  
    
    /// This function makes a loop on the function displayTeams
    /// - parameter players: [Player]
    private func loopChooseDisplayTeams(players: [Player]) {
        inputHelper.loopAction(action: { try displayTeams(players: players) })
    }
    
    
    /// This function makes a loop on the function chooseWarrior
    /// - parameter player: Player
    /// - returns: Warrior
    private func loopChooseWarrior(from player: Player) -> Warrior {
        inputHelper.loopAction(action: { try chooseWarrior(from: player) })
    }
    
    
    /// This function makes a loop on the function choosePlayer
    /// - parameter players: [Player].
    /// - returns: Player
    private func loopChoosePlayer(from players: [Player]) -> Player {
        inputHelper.loopAction(action: { try choosePlayer(from: players) })
    }
    
    
    /// This function makes a loop on the function performWarriorAction
    /// - parameter warriorMakingAction: The warrior that makes action.
    /// - parameter targetWarrior: The warrior targeted
    private func loopChooseWarriorActionToPerform(warriorMakingAction: Warrior, targetWarrior: Warrior) {
        inputHelper.loopAction(action: { try warriorMakingAction.performWarriorAction(targetWarrior: targetWarrior) })
    }
    
    /// This function allows you to choose the warrior who will perform the action
    /// - parameter player: the player targeted
    /// - throws: selected warrior is already dead
    /// - returns: the warrior chosen
    private func chooseWarrior(from player: Player) throws -> Warrior {
        print("Which warrior do you want to choose from \(player.name)? (Enter the number of the warrior)")
        
        let selectedWarrior = try inputHelper.chooseElement(from: player.team)
        
        guard selectedWarrior.isAlive else {
            throw PlayerError.selectedWarriorIsAlreadyDead
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
            throw PlayerError.selectedPlayerIsAlreadyDead
        }
        
        print("You chose to target \(selectedPlayer.name)!")
        
        return selectedPlayer
    }
}
