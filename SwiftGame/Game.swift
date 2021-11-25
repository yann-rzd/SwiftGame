//
//  Game.swift
//  Projet3
//
//  Created by Yann Rouzaud on 18/11/2021.
//

import Foundation

class Game {
    var gameLaunched = false
    var numberOfPlayers = 0
    var players: [Player] = []
    static let minPlayers = 2 // Minimum de joueurs pour lancer la partie
    static let maxPlayers = 5 // Maximum de joueurs pour lancer la partie 
    
    // Démarrer la partie
    func start() {
        print("Do you want to start a new game?")
        
        if let choice = readLine() {
            switch choice {
            case "yes":
                print("You just started a new game!")
                gameLaunched = true
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
                print("I don't understand.")
            }
        }
    }
        
    // Demander le nombre de joueur
    private func askNumberOfPlayers() {
        print("How many players do you want to play with?")
        
        if let answer = readLine() {
            if let number = Int(answer) {
                switch number {
                case _ where (Game.minPlayers <= number || number <= Game.maxPlayers):
                    numberOfPlayers = number
                    print("You want to play with \(number) players.")
                case _ where number < Game.minPlayers:
                    print("You must choose at least \(Game.minPlayers) players to start the game.")
                case _ where number > Game.maxPlayers:
                    print("You must choose a maximum of \(Game.maxPlayers) players to start the game.")
                default:
                    print("I don't understand.")
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
        print("I don't understand.")
        return nil
    }
    
    // Créer le joueur
    private func createPlayer() -> Player? {
        if let playerName = choosePlayerName() {
            let newPlayer = Player(name: playerName)
            return newPlayer
        }
        print("I don't understand.")
        return nil
    }
    
    // Choisir le nom d'un guerrier
    private func readWarriorName() -> String? {
        print("Choose the name of the warrior:")
        
        if let name = readLine() {
            print("You have just created the warrior \(name)!")
            return name
        }
        print("I don't understand.")
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
    private func readWarriorWeapon() throws -> Weapon {
        
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
        if let warriorName = readWarriorName() {
            do {
                let weapon = try readWarriorWeapon()
                let newWarrior = Warrior(name: warriorName, weapon: weapon)
                return newWarrior
            } catch {
                guard let error = error as? Error else { return nil }
                print(error.description)
                return nil
            }
        }
        print("I don't understand.")
        return nil
    }
}
