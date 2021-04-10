

## Purpose and Scope ##

Lands of Aralia is an action/adventure game played on the terminal. A user will select their character (Elf, Dwarf or Warrior), give it a name, and then go on a quest the find the Legendary Ruby Gemstone. There are 4 levels to complete and multiple pathways can be taken to get to the end. On the quest the user faces three battle scenes with progressively harder opponents, and one scene to solve either riddles or math problems. As the user progresses through the game they level up and gain more weapons and greater health. They only have 3 lives and lose a life if they lose a battle scene or get 3 riddle/math questions wrong. 

The battle scenes are played out by the user choosing a weapon to attack with or searching the area for health potions and improved armour. The character stats come into play depending on what the user chooses. Finding health potions increases the character health, improved armour increases the armour rating, and the skill level for each weapon amplifies the attack damage (e.g. the elf has a archery skill of 5, so when an arrow is shot an extra 10 points of damage is done). 

The app is designed for entertainment for anyone who enjoys action/adventure games. It’s a fun game to play as a leisure activity. Due to the violence throughout the game it’s not suitable for children under 15 years of age. Primarily it is targeted at existing fantasy fans who are already familiar with fantasy/RPG games, but it is still accessible to anyone. The game finishes once the user reaches the end and finds the Ruby Gemstone, but due to multiple pathways and randomly generated numbers the user is enticed to play the game multiple times.  

## 3 Features ##

### Combat Style ### 

The combat scenes are the main feature of the game, and it is where the user will spend the most time. When the user enters a battle an intro text appears which sets the scene and introduces the enemy. The user can then choose between different actions using tty-prompt. If they choose to attack, then a damage amount is generated. A method is run to generate a random number (between a specified range) and then the skill level for that weapon is doubled and added to the damage amount. The damage amount is then subtracted from the enemy health and everything is displayed on the terminal screen. 

The enemy immediately attacks back. A similar system is used to calculate damage to the user. A random number is generated, the enemy attacking force variable is added, and the character armour rating is subtracted. This number is then subtracted from the character health. 

The user also has the option to search area. Here a random number is generated, and a case statement used to determine what the user finds (Health Potion, Extreme Health Potion or Improved Armour). This will run a method which updates the relevant instance variable (ie. Finding a health potion updates the character health).  

A while loop is used to continue the battle until either the character or enemy has zero health.
HealthBelowZeroError is used to ensure that the health of either character or enemy doesn’t go below zero. 

### Character Selection and Leveling Up ###

At the start of the game an object called character is created for the Character class. The user chooses a character name and type (Elf, Dwarf or Warrior). This will update the instance variables of the character object to the chosen character stats. These stats affect how the user plays the game (e.g. the Elf has a sword skill of 1 and archery skill of 5. This means they do more damage when shooting arrows than using the sword). The character stats can also be updated throughout the game. 

When the character wins a battle the level goes up by 1. This also increases the character health and gives them a new weapon.  

### Riddle Scene ####

In the riddle scene the user needs to answer 3 questions correctly. They are given some introduction text and then asked riddles one at a time. 

A randomly generated number and case statement is used to choose the riddle. An array is used to store the riddle numbers and `.sample` is used to choose the number. The number chosen is then removed from the array to ensure it’s not repeated. 

To take in the users input `gets.chomp.downcase.split` is used. This puts the answer in lower case, splits up the individual words and puts it in an array. `.include?()` method is then used to check if somewhere in that array is the correct answer. This allows for the user putting in extra words or capital letters. 

If the answer is correct then the `correct_answers` variable goes up by 1. Otherwise the `incorrect_answers` variable goes up by 1. A while loop is used to continue the riddle scene until the user either gets 3 correct answers or 3 incorrect answers.


## User Interaction ##

Everything will be explained to the user when the text sections appear on the screen. It will tell the user what’s happening in the story, where they are and who they have come up against. When the user is required to give input it’s through a menu made with tty-prompt where the user selects their choice. They can’t make any input errors because they can only select the given choices. 

The exception to this is when they provide input for the character name, and riddle and math problem answers. They are prompted with a question and asked to type the answer. They can’t create an error with name selection because anything is excepted. With the riddle and math answers an if loop is used to determine if they have the correct answer. 

The answer is processed using `gets.chomp.downcase.split`. This puts it all in lower case, splits up the words into an array. `.include?()` is used to check if the correct answer is somewhere in the array. This allows for the user putting in any combination of capitals and additional words. If they are correct a message is shown telling the user they got the correct answer, and the `correct_answers` variable goes up by 1. If they are incorrect a similar message is shown telling them they were incorrect, what the correct answer was and that the incorrect_answers variable has gone up by 1. 

There are times where the user is required to press Enter to continue. This is communicated with them by displaying `<Press Enter to Continue>`. 

There is always information displayed at the top of the screen which shows what level the user is on, how many lives left, their character name and type, and their armour rating. These are updated as the game progresses. 
