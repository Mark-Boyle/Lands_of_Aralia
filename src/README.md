# Lands of Aralia #

Lands of Aralia is an action/adventure game run on the terminal.

Play as an Elf, Dwarf or Warrior to find the Legendary Ruby Gemstone. 

Defeat Goblins, Orcs, Trolls and Dragons in battle.

Outsmart Witches and Leprechauns with Riddles and Math Problems. 

Level up and gain new weapons all in this exciting game!

It was written using Ruby 2.7.2.

# Installation #

- Ensure ruby ~> 2.7.2 is installed
- cd into src directory
- type into the command line `./installation.sh`
- This will install the bundler gem
- It will then run `bundle install` which will install all the required gems

# Dependencies #
- ruby ~> 2.7.2

- rspec
- artii
- colorize
- tty-prompt
- bundler

# Command Line Arguments #

- `./aralia.sh --help` or `./aralia.sh -h`

Displays help information for the application

- `./aralia.sh --elf` or `./aralia.sh -e`

Displays information for Elf character.

- `./aralia.sh --dwarf` or `./aralia.sh -d`

Displays information for Dwarf character.

- `./aralia.sh --warrior` or `./aralia.sh -w`

Displays information for Warrior character.

# Usage #

- cd into src directory
- type into the command line `./aralia.sh`

- Once the program is running read the introduction text and 
type in the name of your character and press Enter.
- Next select a character from the menu and confirm choice.
- The characters have different stats for sword, archery and armour. 

- The game is played by entering into battle with varies enemies. 
- Select actions from the menu when prompted.
- Using a weapon will attack the enemy and cause damage.
- Search Area will give the character more health or armour. 
- There is a maximum of 15 armour and 200 health. 

- The battle ends when you or the enemy reach 0 health.
- If you reach 0 health you will lose a life and need to retry the same battle.
- If you lose 3 lives then it's game over. 

- When you win a battle you level up, gain more health and a new weapon.
- You then get to choose which path to take next when prompted.

- Once you reach level 3 you need to either complete riddles or math problems.
- You will be asked the question and required to type in your answer.
- Get 3 correct answers to progress, but 3 incorrect answer means you lose a life.

- The game finishes once you defeat the Dragon on level 4. 

