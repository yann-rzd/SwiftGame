//
//  Game.swift
//  Projet3
//
//  Created by Yann Rouzaud on 18/11/2021.
//

import Foundation

class Game {
    var players: [Player] = []
    var numberOfPlayers = 0 // Faire une propriété calculée
    let numberOfPlayersRange = 2..<5
    var numberOfRounds = 0 // Faire une popriété calculée
    var isGameOver = false
    
    // Démarrer la partie
    func start() {
        print("Do you want to start a new game?")
        
        if let choice = readLine() {
            switch choice {
            case "yes":
                print("You just started a new game!")
                askNumberOfPlayers()
                for i in 1...numberOfPlayers {
                    print("The player \(i) must create his team ✨")
                    let newPlayer = createPlayer()
                    for _ in 1...3 {
                        newPlayer?.team.append(createWarrior()!)
                    }
                    players.append(newPlayer!)
                }
            case "no":
                print("Ok, see you next time!")
            default:
                print("I don't understand ❌")
            }
        }
    }
        
    // Demander le nombre de joueur
    private func askNumberOfPlayers() {
        print("How many players do you want to play with?")
        
        if let answer = readLine() {
            if let number = Int(answer) {
                if numberOfPlayersRange.contains(number) {
                    print("You want to play with \(number) players. You must enter a number between 2 and 5 inclusive")
                } else {
                    print("I don't understand ❌")
                }
            }
        }
    }
    
    // Choisir le nom du joueur
    private func choosePlayerName() -> String? {
        print("Choose the name of your player:")
        
        if let name = readLine() {
            print("Your player is \(name)!")
            return name
        }
        print("I don't understand ❌")
        return nil
    }
    
    // Créer le joueur
    private func createPlayer() -> Player? {
        if let playerName = choosePlayerName() {
            let newPlayer = Player(name: playerName)
            return newPlayer
        }
        print("I don't understand ❌")
        return nil
    }
    
    // Choisir le nom d'un guerrier
    private func askWarriorName() -> String? {
        print("Choose the name of the warrior:")
        
        if let name = readLine() {
            print("You have just created the warrior \(name)!")
            return name
        }
        print("I don't understand ❌")
        return nil
    }
    
    private func getChoseWeaponInstruction() -> String {
        
        var instruction = "Choose the weapon of your warrior:"
       
        for (index, weapon) in Weapon.allCases.enumerated() {
            instruction.append("\n\(index + 1). \(weapon.description)")
        }
        
        return instruction
    }
    
    
    enum Error: Swift.Error {
        case failedToReadTerminal
        case failedToConvertTerminalInputToInteger
        case failedToAccessElementDueToIndexOutOfBounds
        
        
        
        var description: String {
            switch self {
            case .failedToReadTerminal:
                return "failedToReadTerminal"
            case .failedToConvertTerminalInputToInteger:
                return "failedToConvertTerminalInputToInteger"
            case .failedToAccessElementDueToIndexOutOfBounds:
                return "failedToAccessElementDueToIndexOutOfBounds"
            }
        }
    }
    
    // Choisir l'arme d'un guerrier
    private func askWarriorWeapon() throws -> Weapon {
        
        print(getChoseWeaponInstruction())
        
        guard let weaponIndexSelectionString = readLine() else {
            throw Error.failedToReadTerminal
        }
        
        guard let weaponIndexSelection = Int(weaponIndexSelectionString) else {
            throw Error.failedToConvertTerminalInputToInteger
        }
        
        let adaptedWeaponIndexSelection = weaponIndexSelection - 1
        
        guard Weapon.allCases.indices.contains(adaptedWeaponIndexSelection) else {
            throw Error.failedToAccessElementDueToIndexOutOfBounds
        }
        
        let selectedWeapon = Weapon.allCases[adaptedWeaponIndexSelection]
        
        print("Your warrior draws \(selectedWeapon.description) !")
        return selectedWeapon
    }
    
    // Créer un guerrier
    private func createWarrior() -> Warrior? {
        if let warriorName = askWarriorName() {
            do {
                let weapon = try askWarriorWeapon()
                let newWarrior = Warrior(name: warriorName, weapon: weapon)
                return newWarrior
            } catch {
                guard let error = error as? Error else { return nil }
                print(error.description)
                return nil
            }
        }
        print("I don't understand ❌")
        return nil
    }
}
