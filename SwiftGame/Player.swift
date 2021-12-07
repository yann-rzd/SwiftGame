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
    
    enum Error: Swift.Error {
        case terminalError
        case inputIsNotAnInteger
        case inputIsNotOneOrTwo
        case indexInputIsNotInBound
        case selectedWarriorIsDead
        
        
        var description: String {
            switch self {
            case .selectedWarriorIsDead: return "selectedWarriorIsDead"
            case .indexInputIsNotInBound: return "indexInputIsNotInBound"
            case .inputIsNotOneOrTwo: return "inputIsNotOneOrTwo"
            case .terminalError: return "terminalError"
            case .inputIsNotAnInteger: return "inputIsNotAnInteger"
            }
        }
    }
    
    // Jouer son tour
    func playTurn(players: [Player]) {
        guard !isEliminated else {
            print("You have no warriors alive 😢. So you skip your turn ❌.")
            return
        }
        
        do {
            try displayTeams(players: players)
        } catch {
            if let error = error as? Error {
                print(error.description)
            }
        }
        
        let targetPlayer = loopChoosePlayer(from: players)
        let warriorMakingAction = loopChooseWarrior(from: self)
        let targetWarrior = loopChooseWarrior(from: targetPlayer)
        
        try? warriorMakingAction.performWarriorAction(targetWarrior: targetWarrior)
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
                    print(error.description)
                }
            }
        }
    }
    
    // Afficher l'état de son équipe
    func displayTeams(players: [Player]) throws {
        print("Do you want to display the teams? (print 1 for yes, 2 for no)")
        
        guard let answer = readLine() else {
            throw Error.terminalError
        }
        
        guard let number = Int(answer) else {
            throw Error.inputIsNotAnInteger
        }
        
        guard number == 1 || number == 2 else {
            throw Error.inputIsNotOneOrTwo
        }
              
        if number == 1 {
            for (index, player) in players.enumerated() {
                print("This is the team of player \(index + 1), \(player.name):")
                player.displayOwnTeam()
            }
        } else if number == 2 {
            print("So let's get down to business!")
        }
    }
    
    func displayOwnTeam() {
        for (index, warrior) in team.enumerated() {
            print("\(index + 1). Warrior named \(warrior.name) --------------------------------")
            warrior.displayInformation()
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
