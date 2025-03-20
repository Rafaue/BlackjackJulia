# Blackjack in Julia<br>
Blackjack is a popular card game where the player aims to get a score closer to 21 than the dealer without exceeding this value.<br>

 ## Game Description
### Game Objective: Get a score closer to 21 than the dealer.<br>

Cards: Cards 2-10 are worth their face value. Jack, Queen, and King are worth 10 points. Ace can be worth 1 or 11 points.<br>

Gameplay: The player and dealer each receive two cards. The player sees one of the dealer's cards.<br>

Player's Turn: The player can draw cards or stand.  <br>                                                       
                                                                                                           
Dealer's Turn: The dealer must draw cards until they reach at least 17 points.      <br>                      
                                                                                                           
Result: The player with the higher score without exceeding 21 wins.    <br>                                     
                                                                                                           
## Features                                                                                              
Balance: The player starts with a set balance and can place bets on individual rounds.          <br>         

Error Handling: The game handles incorrect input and invalid bets.<br>

Game Continuation: After each round, the player can choose to continue or end the game.<br>

## Motivation
I wrote this game to practically apply my knowledge of the Julia language. It was my first larger application in Julia, which I created a few months ago.<br>


## How to Build and Run the Game<br>

### first install julia in your terminal<br>

 Windows:
winget install julia -s msstore<br>

 Mac:
curl -fsSL https://install.julialang.org | sh<br>

### Navigate to the project directory:
cd Blackjack<br>

### Run Julia with the project:
julia --project=.<br>

### Load the Blackjack module:
using Blackjack<br>

### Start the game:
play()<br>
