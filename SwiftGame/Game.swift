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
    private var numberOfRounds = 0 // Faire une popriété calculée
    
    private var isFightPhaseOver: Bool {
        remainingPlayers.count <= 1
    }
    
    private var remainingPlayers: [Player] {
        players.filter { !$0.isEliminated }
    }
    
    /// This function starts the game
    func start() {
        print("Do you want to start a new game?")
        
        if let choice = readLine() {
            switch choice {
            case "yes":
                print("⚔️ You just started a new game ⚔️ \n")
                
                while true {
                    do {
                        try askNumberOfPlayers()
                        for i in 1...numberOfPlayers {
                            print("The player \(i) must create his team ✨\n")
                            let newPlayer = createPlayer()
                            players.append(newPlayer)
                            for _ in 1...3 {
                                let newWarrior = createWarrior()
                                newPlayer.team.append(newWarrior)
                            }
                        }
                        startFightPhase()
                        displayWinner()
                    } catch {
                        if let error = error as? Error {
                            print(error.description)
                        }
                    }
                }
                
            case "no":
                print("Ok, see you next time!")
            default:
                print("I don't understand ❌")
            }
        }
    }
        
    
    /// This function asks for the number of players participating in the game.
    
    /// - throws:
    /// 1. The terminal failed to read the user's input
    /// 2. The input could not be converted to integer
    /// 3. The input does not match an existing index

    private func askNumberOfPlayers() throws {
        print("How many players do you want to play with? (You must enter a number between 2 and 5 inclusive)")
        
        guard let answer = readLine() else {
            throw Error.failedToReadTerminal
        }
        
        guard let number = Int(answer) else {
            throw Error.failedToConvertTerminalInputToInteger
        }
        
        guard numberOfPlayersRange.contains(number) else {
            throw Error.failedToAccessElementDueToIndexOutOfBounds
        }
        
        print("You want to play with \(number) players.\n")
        numberOfPlayers = number
    }
    
    /// This function asks the player to choose a name.
    
    /// - returns: The name of the player
    /// - throws:
    /// 1. The terminal failed to read the user's input
    /// 2. The name format is not respected
    /// 3. The player's name is already used
    
    private func askPlayerName() throws -> String {
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
        
        guard !players.contains(where: { $0.name.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == name.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) }) else {
            throw Error.faildeToCreateNameDueToDuplication
        }
        
        print("Your player is \(name)!\n")
        return name
    }
    
    // Créer le joueur
    private func createPlayer() -> Player {
        while true {
            do {
                let playerName = try askPlayerName()
                let newPlayer = Player(name: playerName)
                return newPlayer
            } catch {
                if let error = error as? Error {
                    print(error.description)
                }
            }
        }
    }
    
    private func getChoseWarriorTypeInstruction() -> String {
        
        var instruction = "Choose the type of your warrior:"
       
        for (index, warrior) in EnumWarriors.allCases.enumerated() {
            instruction.append("\n\(index + 1). \(warrior.formattedDescription)")
        }
        
        return instruction
    }
    
    
    /// This function asks to choose the type of the warrior
    
    /// - parameter <#parameterName#>: <#Description#>.
    /// - throws: <#Errors throwed#>
    /// - returns: <#Return values#>
    
    private func askWarriorType() {
        
    }
    
    // Choisir le nom d'un guerrier
    private func askWarriorName() throws -> String {
        print("Choose the name of your warrior:")
        
        guard let name = readLine() else {
            throw Error.failedToReadTerminal
        }
        
        guard !name.contains(" ") else {
            throw Error.failedToCreateNameDueToWrongFormat
        }
        
        guard name.count <= 20 else {
            throw Error.failedToCreateNameDueToWrongFormat
        }
        
        guard !players.contains(where: { $0.getHasWarriorInTeamWithSameName(name: name) }) else {
            throw Error.faildeToCreateNameDueToDuplication
        }
        
        print("Your player is \(name)!\n")
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
    private func askWarriorWeapon() throws -> Weapon { // Comment récupérer le nom du guerrier ?
        
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
        
        print("Your warrior draws \(selectedWeapon.description) !\n")
        return selectedWeapon
    }
    
    /// Créer un guerrier
    /// - Returns: the created warrior
    private func createWarrior() -> Warrior {
        while true {
            do {
                let warriorName = try askWarriorName()
                let weapon = try askWarriorWeapon()
                
                let newWarrior = Warrior(name: warriorName, weapon: weapon)
                return newWarrior
            } catch {
                if let error = error as? Error {
                    print(error.description)
                }
            }
        }
    }
    
    // Jouer un round (tous les joueurs doivent jouer une fois)
    private func startFightPhase() {
        while !isFightPhaseOver {
            numberOfRounds += 1
            print("+++++++++++++++++++++++++++++++++++ ⚔️ Round number \(numberOfRounds) starts now ⚔️ +++++++++++++++++++++++++++++++++++\n")
          
            for (playerIndex, player) in players.enumerated() {
                
                guard !player.isEliminated else {
                    print("The player \(players[playerIndex + 1]) \(player.name) is eliminated. So he skips his turn ❌\n")
                    continue
                }
                
                print("--------------- Now it's player #\(playerIndex + 1)'s turn. Let's go \(player.name) ❗️ ---------------\n")
                player.playTurn(players: players)
                
             
                guard !isFightPhaseOver else {
                    break
                }
            }
            print("Round number \(numberOfRounds) is now over.\n")
        }
    }
    
    private func displayWinner() {
        guard
            remainingPlayers.count == 1,
            let winningPlayer = remainingPlayers.first else {
            print("There is no winner\n")
            return
        }
        
        print("The player \(winningPlayer.name) won the game ! 🎉🎉🎉🎉🎉🎉 Congratulations 🎉🎉🎉🎉🎉🎉\n") // Comment récuprer le nom du gagnant ?
        print("**********************************************  End of the game **********************************************")
    }
}
