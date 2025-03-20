#Blackjack in Julia
Blackjack is a popular card game where the player aims to get a score closer to 21 than the dealer without exceeding this value.
               
![image](https://github.com/user-attachments/assets/7a699bc4-aaac-40d5-936f-c6706a8398cb)

Game Description
Game Objective: Get a score closer to 21 than the dealer.

Cards: Cards 2-10 are worth their face value. Jack, Queen, and King are worth 10 points. Ace can be worth 1 or 11 points.

Gameplay: The player and dealer each receive two cards. The player sees one of the dealer's cards.

Player's Turn: The player can draw cards or stand.

Dealer's Turn: The dealer must draw cards until they reach at least 17 points.

Result: The player with the higher score without exceeding 21 wins.

Features
Balance: The player starts with a set balance and can place bets on individual rounds.

Error Handling: The game handles incorrect input and invalid bets.

Game Continuation: After each round, the player can choose to continue or end the game.

Motivation
I wrote this game to practically apply my knowledge of the Julia language. It was my first larger application in Julia, which I created a few months ago.

Technologies and Skills
During the development of this project, I developed skills in the following areas:

Julia Programming: I learned the basics of the Julia language, including data types, control structures, functions, and modules.

Error Handling: I learned how to handle incorrect input and exceptions in Julia.

Code Structure: I understood the importance of a readable and organized code structure using modules and functions.

Card Game Logic: I implemented the logic of the Blackjack game, including shuffling the deck, dealing cards, and determining the outcome.


How to Build and Run the Game

first install julia in your terminal

Windows:
winget install julia -s msstore

Mac:
curl -fsSL https://install.julialang.org | sh

Navigate to the project directory:

cd Blackjack
Run Julia with the project:

julia
julia --project=.
Load the Blackjack module:

julia
using Blackjack
Start the game:

julia
play()
