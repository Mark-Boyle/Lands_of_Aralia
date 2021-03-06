require_relative('character')
require_relative('enemy')
require 'artii'
require 'colorize'

def display_intro_message
    system 'clear'
    puts ' '
    a = Artii::Base.new
    puts a.asciify('Lands of Aralia!').colorize(:light_green)
    puts 'Welcome to the Lands of Aralia!!'
    puts ' '
    puts "The Lands of Aralia are a beautiful yet dangerous place."
    puts "Tales of the Legendary Ruby Gemstone have lured many\ntreasure hunters into these lands."
    puts ' '
    puts 'It is a dangerous path filled with many challenges to overcome.'
    puts "But it is said that this Ruby Gemstone is more beautiful than the \nmind can comprehend."
    puts ' '
    puts "One brave, adventurous soul has set out on a quest\nto find it!"
end

def explain_available_items(name)
    system 'clear'
    puts "Welcome #{name}!".colorize(:light_green)
    puts ' '
    puts "You are about to embark on a quest for the Legendary Ruby Gemstone!"
    puts "You have with you:"
    puts " - Sword".colorize(:blue).bold
    puts " - Bow and Arrows".colorize(:blue).bold
    puts " - Armour".colorize(:blue).bold
    puts ' '
    puts "Throughout the land you may be lucky enough to find:"
    puts " - Health Potions".colorize(:blue).bold
    puts " - Extreme Health Potions".colorize(:blue).bold
    puts " - Improved Armour".colorize(:blue).bold
    puts ' '
    puts "You're all set to begin your adventure!"
    puts ' '
    puts "<Press Enter to begin>"
    gets
    system 'clear'
end

def display_goblin_intro
    puts ' '
    puts 'You begin your adventure by hiking through the fields of Yellow Meadows.'
    puts 'Eager to explore the new lands you power forward full of energy.'
    puts ' '
    puts "Suddenly a Goblin jumps out in front of you!"
    puts "Waving it's arms about wildly, you can see \nit's sharp teeth through it's evil grin."
    puts ' '
    puts "It comes charging at you ready for a fight!"
    puts ' '
end

def display_troll_intro
    puts ' '
    puts 'Climbing through the Snowy Mountains is hard work.'
    puts 'The temperatures are freezing and the wind is strong.'
    puts ' '
    puts "You come across a small landing which is sheltered from the wind."
    puts "But to your horror you realise you just woke a sleeping troll!"
    puts ' '
    puts "It rises up, angry from being disturbed!"
    puts "Towering over you, it starts to attack!"
    puts ' '
end

def display_orc_intro
    puts ' '
    puts 'Wandering down the valley.'
    puts 'An Orc jumps out from behind a rock!.'
    puts ' '
    puts "It lets out a loud snarl and leaps towards you!"
    puts ' '
end

def display_dragon_intro
    puts ' '
    puts "You enter the cave where the Ruby Gemstone is located."
    puts "With brave courage you venture deep into the cave."
    puts ' '
    puts "The cave opens up into a large cavern with natural light \nshining down from high above."
    puts ' '
    puts "In the middle of the cavern lies a sleeping dragon."
    puts "You see the Legendary Ruby Gemstone behind the dragon \nand feel a jolt of excitement!"
    puts ' '
    puts "As you try to sneak past, the dragon opens its eyes, raises its head." 
    puts "With an angry glare it breaths fire in your direction!"
    puts "You manage to hide behind a rock but you realise the battle has begun!!"
    puts ' '
end

def display_witch_intro
    puts ' '
    puts "As you walk along the river you notice an old witch waiting for you in the distance."
    puts 'When you get close by, her eyes suddenly fly open and give you a deathly stare!'
    puts ' '
    puts "'You shall not pass until you solve 3 riddles' she says."
    puts "'But think wisely, because 3 wrong answers will cause a \nterrible spell to fall upon you.'"
    puts ' '
    puts "The witch raises her hand and says 'The first riddle is:'"
    puts ' '
end

def display_leprechaun_intro
    puts ' '
    puts "You wander through the forest, listening to the birds singing."
    puts ' '
    puts 'Out from behind a tree jumps a little leprechaun!'
    puts 'Dancing on his toes, he greets you with a smile on his face.'
    puts ' '
    puts "'Hello adventurous explorer! What a fine day for a stroll!'"
    puts "'I have a little game for you. Some math problems to solve.'"
    puts "3 correct answers will set you further on your path."
    puts "But 3 incorrect answers and you shall not pass!"
    puts ' '
    puts 'The first problem is:'
end

def display_victory_message(enemy)
    a = Artii::Base.new
    puts a.asciify('Victory!').colorize(:light_green)
    puts ' '
    puts "Congratulations! You defeated the #{enemy}!"
    puts ' '
    puts '<Press Enter to Continue>'
    gets
end

def display_final_victory_message
    system 'clear'
    puts ' '
    puts 'Congratulations!!'.colorize(:light_green)
    puts ' '
    puts "As the Dragon slumps to the ground, \n"
    puts "you run to the back of the cavern to claim your prize."
    puts ' '
    puts "As you pick up the Legendary Ruby Gemstone it shines\n"
    puts "brighlty in your hands, lighting up the cavern in red."
    puts ' '
    puts 'You stare deeply into the gemstone and are in awe of its beauty!' 
    puts ' '
    puts "Victory is yours!!"
end

def display_first_path_choice
    puts ' '
    puts "You've come to a fork in the road."
    puts ' '
    puts "One direction leads you over the Snowy Mountains."
    puts ' '
    puts "The other takes you down the valley."
end

def display_second_path_choice
    puts ' '
    puts "You've come to a fork in the road."
    puts ' '
    puts "One direction leads you along a river."
    puts ' '
    puts "The other takes you into the forest."
end

def process_first_path_choice
    prompt = TTY::Prompt.new
    path = prompt.select("What path would you like to go down?") do |menu|
        menu.choice "Snowy Mountains", 1
        menu.choice "Valley", 2
    end
end

def display_level_1_victory
    system 'clear'
    puts 'Level UP!!'.colorize(:light_blue)
    puts ' '
    print 'You are now on Level '
    puts "2".colorize(:light_yellow)
    puts ' '
    print "Your health has gone up to "
    puts "120.".colorize(:light_yellow)
    print "You have been rewarded with a "
    puts "Spear!".colorize(:cyan)
    puts ' '
    puts '<Press Enter to Continue>'
    gets
end

def display_level_2_victory
    system 'clear'
    puts 'Level UP!!'.colorize(:light_blue)
    puts ' '
    print 'You are now on Level '
    puts "3".colorize(:light_yellow)
    puts ' '
    print "Your health has gone up to "
    puts "130.".colorize(:light_yellow)
    print "You have been rewarded with a "
    puts "Battleaxe!".colorize(:cyan)
    puts ' '
    puts '<Press Enter to Continue>'
    gets
end

def display_level_3_victory
    system 'clear'
    puts 'Level UP!!'.colorize(:light_blue)
    puts ' '
    print 'You are now on Level '
    puts "4".colorize(:light_yellow)
    puts ' '
    print "Your health has gone up to "
    puts "140".colorize(:light_yellow)
    puts ' '
    puts '<Press Enter to Continue>'
    gets
end

def display_help_documentation
puts "Lands of Aralia".colorize(:light_green)
puts "Lands of Aralia is an action/adventure game run on the terminal."
puts "Play as an Elf, Dwarf or Warrior to find the Legendary Ruby Gemstone."
puts "Defeat Goblins, Orcs, Trolls and Dragons in battle."
puts "Outsmart Witches and Leprechauns with Riddles and Math Problems."
puts "Level up and gain new weapons all in this exciting game!"
puts "It was written using Ruby 2.7.2.\n\n"

puts "Installation".colorize(:light_green)
puts "- Ensure ruby ~> 2.7.2 is installed"
puts "- cd into src directory"
puts "- type into the command line `./installation.sh`"
puts "- This will install the bundler gem"
puts "- It will then run `bundle install` which will install all the required gems\n\n"

puts "Dependencies".colorize(:light_green)
puts "- ruby ~> 2.7.2"
puts "- rspec"
puts "- artii"
puts "- colorize"
puts "- tty-prompt"
puts "- bundler\n\n"

puts "Command Line Arguments".colorize(:light_green)

puts "- `./aralia.sh --help` or `./aralia.sh -h`"
puts "Displays help information for the application\n\n"

puts "- `./aralia.sh --elf` or `./aralia.sh -e`"
puts "Displays information for Elf character.\n\n"

puts "- `./aralia.sh --dwarf` or `./aralia.sh -d`"
puts "Displays information for Dwarf character.\n\n"

puts "- `./aralia.sh --warrior` or `./aralia.sh -w`"
puts "Displays information for Warrior character.\n\n"

puts "Usage".colorize(:light_green)

puts "- cd into src directory"
puts "- type into the command line `./aralia.sh`\n\n"

puts "- Once the program is running read the introduction text and "
puts "type in the name of your character and press Enter."
puts "- Next select a character from the menu and confirm choice."
puts "- The characters have different stats for sword, archery and armour.\n\n"

puts "- The game is played by entering into battle with varies enemies. "
puts "- Select actions from the menu when prompted."
puts "- Using a weapon will attack the enemy and cause damage."
puts "- Search Area will give the character more health or armour. "
puts "- There is a maximum of 15 armour and 200 health.\n\n"

puts "- The battle ends when you or the enemy reach 0 health."
puts "- If you reach 0 health you will lose a life and need to retry the same battle."
puts "- If you lose 3 lives then it's game over.\n\n"

puts "- When you win a battle you level up, gain more health and a new weapon."
puts "- You then get to choose which path to take next when prompted.\n\n"

puts "- Once you reach level 3 you need to either complete riddles or math problems."
puts "- You will be asked the question and required to type in your answer."
puts "- Get 3 correct answers to progress, but 3 incorrect answer means you lose a life.\n\n"

puts "- The game finishes once you defeat the Dragon on level 4." 

end