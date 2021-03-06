//
//  Game.swift
//  Projet3
//
//  Created by Yann Rouzaud on 18/11/2021.
//

import Foundation

final class Game {
    
    // MARK: - INTERNAL: methods
    
    /// This function starts the game
    func start() {
        let isWillingToPlay = inputHelper.loopAction(action: { try askStartNewGame() })
        guard isWillingToPlay else { return }
        inputHelper.loopAction(action: { try askNumberOfPlayers() })
        
        for playerIndex in 1...numberOfPlayers {
            print("The player \(playerIndex) must create his team ✨\n")
            let newPlayer = createPlayer()
            players.append(newPlayer)
            
            for _ in 1...numberOfWarriorPerTeam {
                let newWarrior = createWarrior()
                newPlayer.team.append(newWarrior)
            }
        }
        
        startFightPhase()
        displayWinner()
    }

    
    // MARK: - PRIVATE : properties
    
    private var players: [Player] = []
    private var numberOfPlayers = 0
    private let numberOfPlayersRange = 2..<5
    private let numberOfWarriorPerTeam = 3
    private var numberOfRounds = 0
    
    private var isFightPhaseOver: Bool {
        remainingPlayers.count <= 1
    }
    
    private var remainingPlayers: [Player] {
        players.filter { !$0.isEliminated }
    }
    
    private let inputHelper = InputHelper.shared
    
    
    //MARK: - PRIVATE: methods
    
    /// This function ask to the player if he wants to start a new game
    /// - returns: Bool
    private func askStartNewGame() throws -> Bool {
        print("Do you want to start a new game? (1 for yes, 2 for no)")
        
        guard let answer = readLine() else {
            throw GameError.failedToReadTerminal
        }
        
        guard let number = Int(answer) else {
            throw GameError.failedToConvertTerminalInputToInteger
        }
        
        switch number {
        case 1:
            print("⚔️ You just started a new game ⚔️ \n")
            return true
        case 2:
            print("Ok, see you next time!")
            return false
        default: throw GameError.failedIsNotOneAndTwo
        }
    }
    
    
    /// This function asks for the number of players participating in the game.
    private func askNumberOfPlayers() throws {
        print("How many players do you want to play with? (You must enter a number between 2 and 5 inclusive)")
        
        guard let answer = readLine() else {
            throw GameError.failedToReadTerminal
        }
        
        guard let number = Int(answer) else {
            throw GameError.failedToConvertTerminalInputToInteger
        }
        
        guard numberOfPlayersRange.contains(number) else {
            throw GameError.failedToAccessElementDueToIndexOutOfBounds
        }
        
        print("You want to play with \(number) players.\n")
        numberOfPlayers = number
    }
    
    
    /// This function asks the player to choose a name
    /// - returns: The name of the playerg
    private func askPlayerName() throws -> String {
        print("Choose the name of your player:")
        
        guard let name = readLine() else {
            throw GameError.failedToReadTerminal
        }
        
        guard !name.contains(" ") else {
            throw GameError.failedToCreateNameDueToWrongFormat
        }
        
        guard name.count <= 20 else {
            throw GameError.failedToCreateNameDueToWrongFormat
        }
        
        guard !players.contains(where: { $0.name.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == name.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) }) else {
            throw GameError.faildeToCreateNameDueToDuplication
        }
        
        print("Your player is \(name)!\n"
            + "Now you have to choose 3 warriors to create your team 🕹\n")
        return name
    }
    
    
    /// This function creates the player
    /// - returns: The new player
    private func createPlayer() -> Player {
        while true {
            do {
                let playerName = try askPlayerName()
                let newPlayer = Player(name: playerName)
                return newPlayer
            } catch {
                if let error = error as? GameError {
                    print(error.errorDescription ?? "")
                }
            }
        }
    }
    
    
    /// This function lists all the warrior types
    /// - returns: List of all types of warriors
    private func getChoseWarriorTypeInstruction() -> String {
        
        var instruction = "Choose the type of your warrior:"
       
        for (index, warrior) in EnumWarriors.allCases.enumerated() {
            instruction.append("\n\(index + 1). \(warrior.formattedDescription)")
        }
        
        return instruction
    }
    
    
    /// This function displays the list of all types of warrior and asks to choose the type of the warrior
    /// - returns: The type of warrior chosen
    private func askWarriorType() throws -> EnumWarriors {
        print(getChoseWarriorTypeInstruction())
        
        let selectedWarriorType = try inputHelper.chooseElement(from: EnumWarriors.allCases)
        
        print("You chose the \(selectedWarriorType.name) !")
        
        return selectedWarriorType
    }
    
    
    /// This function asks to choose the name of the warrior
    /// - returns: The name of the warrior
    private func askWarriorName() throws -> String {
        print("Choose the name of your warrior:")
        
        guard let name = readLine() else {
            throw GameError.failedToReadTerminal
        }
        
        guard !name.contains(" ") else {
            throw GameError.failedToCreateNameDueToWrongFormat
        }
        
        guard name.count <= 20 else {
            throw GameError.failedToCreateNameDueToWrongFormat
        }
        
        guard !players.contains(where: { $0.getHasWarriorInTeamWithSameName(name: name) }) else {
            throw GameError.faildeToCreateNameDueToDuplication
        }
        
        print("Your player is \(name)!\n")
        return name
    }
    
    
    /// This function lists all the weapons
    /// - returns: List of all the weapons
    private func getChoseWeaponInstruction() -> String {
        
        var instruction = "Choose the weapon of your warrior:"
       
        for (index, weapon) in Weapon.allCases.enumerated() {
            instruction.append("\n\(index + 1). \(weapon.description)")
        }
        
        return instruction
    }
    
    
    /// This function displays the list of all the weapons and asks to choose a weapon
    /// - returns: The weapon chosen
    private func askWarriorWeapon() throws -> Weapon {
        
        print(getChoseWeaponInstruction())
        
        guard let weaponIndexSelectionString = readLine() else {
            throw GameError.failedToReadTerminal
        }
        
        guard let weaponIndexSelection = Int(weaponIndexSelectionString) else {
            throw GameError.failedToConvertTerminalInputToInteger
        }
        
        let adaptedWeaponIndexSelection = weaponIndexSelection - 1
        
        guard Weapon.allCases.indices.contains(adaptedWeaponIndexSelection) else {
            throw GameError.failedToAccessElementDueToIndexOutOfBounds
        }
        
        let selectedWeapon = Weapon.allCases[adaptedWeaponIndexSelection]
        
        print("Your warrior draws \(selectedWeapon.description) !\n")
        return selectedWeapon
    }
    
    
    /// This function creates the warrior with its type, name and weapon previously defined
    /// - Returns: The created warrior
    private func createWarrior() -> Warrior {
        
        let warriorType = inputHelper.loopAction(action: { try askWarriorType() })
        let warriorName = inputHelper.loopAction(action: { try askWarriorName() })
        let weapon = inputHelper.loopAction(action: { try askWarriorWeapon() })
        
        switch warriorType {
        case .humanWarrior:
            return HumanWarrior(name: warriorName, weapon: weapon)
        case .dwarfWarrior:
            return DwarfWarrior(name: warriorName, weapon: weapon)
        case .elfWarrior:
            return ElfWarrior(name: warriorName, weapon: weapon)
        case .giantWarrior:
            return GiantWarrior(name: warriorName, weapon: weapon)
        case .wizardWarrior:
            return WizardWarrior(name: warriorName, weapon: weapon)
        case .goblinWarrior:
            return GoblinWarrior(name: warriorName, weapon: weapon)
        }
    }
    
    
    /// This function starts the fight process between the players
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
    
    /// This function displays the winner at the end of the game
    private func displayWinner() {
        guard
            remainingPlayers.count == 1,
            let winningPlayer = remainingPlayers.first else {
            print("There is no winner\n")
            return
        }
        
        print("The player \(winningPlayer.name) won the game ! 🎉🎉🎉🎉🎉🎉 Congratulations 🎉🎉🎉🎉🎉🎉\n")
        print("Number of rounds: \(numberOfRounds) 🥊\n")
        print("Status of the team:")
        winningPlayer.displayOwnTeam()
        print("\n**********************************************  End of the game **********************************************")
    }
}
