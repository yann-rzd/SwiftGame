//
//  Player.swift
//  Projet3
//
//  Created by Yann Rouzaud on 24/11/2021.
//

import Foundation

class Player {
    let name: String
    
    var isEliminated: Bool {
        !team.contains { $0.isAlive }
    }
    
    var team: [Warrior] = []
    
    init(name: String) {
        self.name = name
    }
    
    // Jouer son tour
    func playTurn(players: [Player]) {
        guard !isEliminated else {
            print("You have no warriors alive 😢. So you skip your turn ❌.")
            return
        }
        
        displayTeams(players: players)
        
        let targetPlayer = loopChoosePlayer(from: players)
        let warriorMakingAction = loopChooseWarrior(from: self)
        let targetWarrior = loopChooseWarrior(from: targetPlayer)
        
        warriorMakingAction.performWarriorAction(targetWarrior: targetWarrior)
    }
    
    private func loopChooseWarrior(from player: Player) -> Warrior {
        loopAction(action: chooseWarrior(from:), parameter: player)
    }
    
    private func loopChoosePlayer(from players: [Player]) -> Player {
        loopAction(action: choosePlayer(from:), parameter: players)
    }
    
    private func loopAction<T, U>(action: (U) throws -> T, parameter: U) -> T {
        while true {
            do {
                let chosenElement = try action(parameter)
                return chosenElement
            } catch {
                if let error = error as? Error {
                    print(error.testDescription)
                }
            }
        }
    }
    
    // Afficher l'état de son équipe
    func displayTeams(players: [Player]) {
        print("Do you want to display the teams? (yes or no)")
              
        if let answer = readLine() {
            if answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == "yes" {
                
                for (index, player) in players.enumerated() {
                    print("This is the team of player \(index + 1), \(player.name):")
                    player.displayOwnTeam()
                }
                
                
        
            } else if answer == "no" {
                print("So let's get down to business!")
            } else {
                print("I don't understand ❌")
            }
        }
    }
    
    func displayOwnTeam() {
        for (index, warrior) in team.enumerated() {
            print("\(index + 1). Warrior named \(warrior.name) --------------------------------")
            warrior.displayInformation()
        }
    }
    
    
    enum Error: Swift.Error {
        case terminalError
        case inputIsNotAnInteger
        case indexInputIsNotInBound
        case selectedWarriorIsDead
        
        
        var testDescription: String {
            switch self {
            case .selectedWarriorIsDead: return "selectedWarriorIsDead"
            case .indexInputIsNotInBound: return "indexInputIsNotInBound"
            case .terminalError: return "terminalError"
            case .inputIsNotAnInteger: return "inputIsNotAnInteger"
            }
        }
    }
    
    
    // Choisir le guerrier qui faire l'action
    private func chooseWarrior(from player: Player) throws -> Warrior {
        print("Which warrior do you want to choose from \(player.name)? (Enter the number of the warrior)")
        
        let selectedWarrior = try chooseElement(from: player.team)
        
        guard selectedWarrior.isAlive else {
            throw Error.selectedWarriorIsDead
        }
        
        //print("Your must enter a number between 1 and 3 and choose a warrior still alive.")
        

        print("The warrior \(selectedWarrior.name) takes action!")
        
        
        return selectedWarrior
    }
    
    
    // Choisir le guerrier qui faire l'action
    private func choosePlayer(from players: [Player]) throws -> Player {
        print("Which player do you want to choose ? (Enter the number of the player)")
        
        let selectedPlayer = try chooseElement(from: players)
        
        guard !selectedPlayer.isEliminated else {
            throw Error.selectedWarriorIsDead
        }
        
        //print("Your must enter a number between 1 and 3 and choose a warrior still alive.")
        

        print("The player \(selectedPlayer.name) takes action!")
        
        
        return selectedPlayer
    }
    
    
    
    private func chooseElement<T>(from array: [T]) throws -> T {
        
        guard let indexStringInput = readLine() else {
            throw Error.terminalError
        }
        
        guard let indexInput = Int(indexStringInput) else {
            throw Error.inputIsNotAnInteger
        }
        
        let elementIndex = indexInput - 1
        
        
        guard array.indices.contains(elementIndex) else {
            throw Error.indexInputIsNotInBound
        }
        
        
        let selectedElement = array[elementIndex]
    
        //print("Your must enter a number between 1 and 3 and choose a warrior still alive.")

        
        
        return selectedElement
    }

}
