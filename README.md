# Swift Game
🕹️ RPG game with a turn-based combat system

<img src="https://i.imgur.com/Y1Rm1QG.png" width="600" height="600">

## 🎮 About
### The principle of the game:
- The game is an RPG (Role Playing Game)
- The player embodies a character and must face other players
- The combat system: turn-based combat

### Global functioning of the game:
- The game is composed of 2 players
- Each player has a team of 3 characters
- Each character has life points, a name and a weapon

### Turn-based combat:
- Player 1 must choose a character from his team
- Player 1 must choose a character who will take an action
- The character must perform the action (attack or heal)
- We check if the game is over
- If not, it is player 2's turn

### Attacks :
- Each character attacks with a weapon
- A chest with another weapon can appear in front of the character during his turn

### The criteria to be respected:
- Each player must create 3 characters
- The player must choose a name for each character that is different from all other characters created
- Each character must have a weapon. It is the weapon that determines the damage that the character will inflict
- A crate with a new weapon can appear randomly when a character takes a turn
Once the game is over, the number of turns and the list of characters of both teams with their properties are displayed.

## 🎮 Creation of teams
<img src="https://i.imgur.com/zKuG7Ak.png" width="300" height="400">

### Step 1 : 
- Between 2 and 5 players on the same game
- Each player must choose his name (unique)

### Step 2 :
- Each player must choose the type of their warrior

### Step 3:
- Each player must choose the name of his warrior (unique)

### Step 4:
- Each player must choose the weapon of his warrior

### Each player must create 3 warriors

## 💻 Requirements
Reciplease is written in Swift 5 and supports iOS 13.0+. Built with Xcode 13.

## 🍀 Architecture
This application is developed according to the [MVC](https://medium.com/@joespinelli_6190/mvc-model-view-controller-ef878e2fd6f5) architecture.

## 🕵️‍♂️ How to test 
### Clone the project

Run `git@https://github.com/yann-rzd/Instagrid.git`

Open `Instagrid.xcodeproj`

Build & Run 🔥
