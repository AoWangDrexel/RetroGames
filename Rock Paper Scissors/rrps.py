"""
Author: Ao Wang
Date: 08/23/19

Description: The game is Rock Paper Scissors with a certain twist.
There is a random operation when the weaker hand will win instead of
the stronger. For example, player one draws a rock and player two draws
a scissor, but the game declares the weaker hand, therefore player two
wins. So, the move that would normally win, loses. If the game declares
a stronger hand, it will continue as normal. If there is a tie, it 
will remain a tie with either hand.
"""

import random

# The function determines the winner due to the move and if reverse is True or False
def checkWinner(player, opponent, reverse):
    
    # ties game
    if player == opponent:
        return 0
    
    # loses game, unless reverse is true, the weaker hand wins
    if (player == "r" and opponent == "p") or (player == "p" and opponent == "s") or \
    (player == "s" and opponent == "r"):
        if reverse:
            return 1
        return -1 
    
    # wins game, unless reverse is true, the stronger hand loses
    if (player == "p" and opponent == "r") or (player == "s" and opponent == "p") or \
       (player == "r" and opponent == "s"):
        if reverse:
            return -1
        return 1

# The function is for whether the player wants a computer opponent
def computer():
    choices = ["r", "p", "s"]
    return random.choice(choices)

# The function returns the full name of the appreviated letter moves
def fullName(move):
    if move == "r":
        return "Rock"
    elif move == "p":
        return "Paper"
    elif move == "s":
        return "Scissors"

# Introduction
print("Welcome to the Reverse Rock Paper Scissor Game!")
print("""
    _______              _______                 _______
---'   ____)         ---'   ____)____        ---'   ____)____
      (_____)                  ______)                 ______)
      (_____)                  _______)             __________)
      (____)                  _______)             (____)
---.__(___)          ---.__________)        ---.__(___)
                
""")

play_again = "y"
user_score = 0
computer_score = 0
name = input("What is your name? ")

while play_again == "y":
    choice = input("Make your move, " + name + "! Rock (r), paper (p), or scissors (s)? ")
    choice = choice.lower()
    print()

    # 1/2 chance of a weaker hand (False), or stronger hand (True)
    hand = random.choice([True, False])
    opponent = computer()
    win_result = checkWinner(choice, opponent, hand)

    if hand:
        print("Weaker hand!")
    else:
        print("Stronger hand!")

    print(fullName(choice) + " vs " + fullName(opponent) + "\n")

    if win_result == 0:
        print("It was a draw!\n")
    elif win_result == 1:
        print(name + " won!\n")
        user_score += 1
    elif win_result == -1:
        print("The computer won!\n")
        computer_score += 1
        
    print(name + ": " + str(user_score) + "\nComputer: " + str(computer_score))
    
    play_again = input("Would you like to play again? (y or n) ")
    play_again = play_again.lower()
    
    # DeMorgan's Law: play_again != "y" and play_again != "n"
    while not(play_again == "y" or play_again == "n"):
        print("There is an error. Please enter again")
        play_again = input("Would you like to play again? (y or n) ")
        
print()        
print("Thank you for playing!")
