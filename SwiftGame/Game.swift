//
//  Game.swift
//  Projet3
//
//  Created by Yann Rouzaud on 18/11/2021.
//

import Foundation

class Game {
    private var players: [Player] = []
    private var numberOfPlayers = 0 // Faire une propriété calculée
    private let numberOfPlayersRange = 2..<5
    private var numberOfRounds = 1 // Faire une popriété calculée
    
    private var isFightPhaseOver: Bool {
        remainingPlayers.count <= 1
    }
    
    private var remainingPlayers: [Player] {
        players.filter { !$0.isEliminated }
    }
    
    // Démarrer la partie
    func start() {
        print("Do you want to start a new game?")
        
        if let choice = readLine() {
            switch choice {
            case "yes":
                print("You just started a new game!")
                
                do {
                    try askNumberOfPlayers()
                } catch {
                    if let error = error as? Error {
                        print(error.description)
                    }
                }
                
                for i in 1...numberOfPlayers {
                    print("The player \(i) must create his team ✨")
                    let newPlayer = createPlayer()
                    for _ in 1...3 {
                        newPlayer?.team.append(try! createWarrior())
                    }
                    players.append(newPlayer!)
                }
            case "no":
                print("Ok, see you next time!")
            default:
                print("I don't understand ❌")
            }
        }
        
        startFightPhase()
        displayWinner()
    }
        
    // Demander le nombre de joueur
    private func askNumberOfPlayers() throws {
        print("How many players do you want to play with? You must enter a number between 2 and 5 inclusive.")
        
        guard let answer = readLine() else {
            throw Error.failedToReadTerminal
        }
        
        guard let number = Int(answer) else {
            throw Error.failedToConvertTerminalInputToInteger
        }
        
        guard numberOfPlayersRange.contains(number) else {
            throw Error.failedToAccessElementDueToIndexOutOfBounds
        }
        
        print("You want to play with \(number) players.")
        numberOfPlayers = number
    }
    
    // Choisir le nom du joueur
    private func choosePlayerName() throws -> String {
        print("Choose the name of your player:")
        
        guard let name = readLine() else {
            throw Error.failedToReadTerminal
        }
        
        guard !name.contains(" ") else {
            throw Error.failedToCreateNameDueToWrongFormat
        }
        
        guard name.count <= 20 else {
            throw Error.failedToCreateNameDueToWrongFormat
        }
        
        guard !players.contains(where: { $0.name == name }) else {
            throw Error.faildeToCreateNameDueToDuplication
        }
        
        print("Your player is \(name)!")
        return name
    }
    
    // Créer le joueur
    private func createPlayer() -> Player? {
        
        do {
            let playerName = try choosePlayerName()
            let newPlayer = Player(name: playerName)
            return newPlayer
        } catch {
            if let error = error as? Error {
                print(error.description)
            }
        }
        
        print("I don't understand ❌")
        return nil
    }
    
    // Choisir le nom d'un guerrier
    private func askWarriorName() throws -> String {
        print("Choose the name of the warrior:")
        
        guard let name = readLine() else {
            throw Error.failedToReadTerminal
        }
        
        guard (name.hasPrefix(" ") || name.hasSuffix(" ")) || name.count > 20 else {
            throw Error.failedToCreateNameDueToWrongFormat
        }
        
        print("Your player is \(name)!")
        return name
    }
    
    private func getChoseWeaponInstruction() -> String {
        
        var instruction = "Choose the weapon of your warrior:"
       
        for (index, weapon) in Weapon.allCases.enumerated() {
            instruction.append("\n\(index + 1). \(weapon.description)")
        }
        
        return instruction
    }
    
    
    /// Choisir l'arme d'un guerrier
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
    
    /// Créer un guerrier
    /// - Returns: the created warrior
    private func createWarrior() throws -> Warrior {
        
        guard let warriorName = try? askWarriorName() else {
            throw Error.failedToNameTheWarrior
        }
        
        let weapon = try? askWarriorWeapon()
        let newWarrior = Warrior(name: warriorName, weapon: weapon ?? <#default value#>)
        return newWarrior
    }
    
    // Jouer un round (tous les joueurs doivent jouer une fois)
    private func startFightPhase() {
        while !isFightPhaseOver {
            numberOfRounds += 1
            print("+++++++++++++++++++++++++++++++++++ ⚔️ Round number \(numberOfRounds) starts now ⚔️ +++++++++++++++++++++++++++++++++++")
          
            for (playerIndex, player) in players.enumerated() {
                
                guard !player.isEliminated else {
                    print("The player \(players[playerIndex + 1]) \(player.name) is eliminated. So he skips his turn ❌")
                    continue
                }
                
                print("--------------- Now it's player #\(playerIndex + 1)'s turn. Let's go \(player.name) ❗️ ---------------")
                player.playTurn(players: players)
                
             
                guard !isFightPhaseOver else {
                    break
                }
            }
            print("Round number \(numberOfRounds) is now over.")
        }
    }
    
    private func displayWinner() {
        guard
            remainingPlayers.count == 1,
            let winningPlayer = remainingPlayers.first else {
            print("There is no winner")
            return
        }
        
        print("The player \(winningPlayer.name) won the game ! 🎉🎉🎉🎉🎉🎉 Congratulations 🎉🎉🎉🎉🎉🎉") // Comment récuprer le nom du gagnant ?
        print("**********************************************  End of the game **********************************************")
    }
}
