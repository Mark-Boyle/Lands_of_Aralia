require_relative('character')
require_relative('enemy')
require_relative('storyline')
require_relative('errors')
require 'tty-prompt'
require 'artii'
require 'colorized_string'
require 'colorize'

prompt = TTY::Prompt.new

level = 1
lives = 3
path = 1

#Introduction
def display_intro_message
    system 'clear'
    puts ' '
    a = Artii::Base.new
    puts a.asciify('Lands of Aralia!')
    puts 'Welcome to the Lands of Aralia!!'
    puts ' '
    puts "The Lands of Aralia are a beautiful yet dangerous place."
    puts "Tales of the Legendary Ruby Gemstone have lured many\ntreasure hunters into these lands."
    puts ' '
    puts 'It is a dangerous path filled with many challenges to overcome.'
    puts "But it is said that this Ruby Gemstone is more beautiful than the \nmind can comprehend."
    puts ' '
    puts "One brave, adventurous soul has set out on a quest\nto find it!"
    # puts String.color_samples
end


def select_character(prompt)
    puts ' '
    prompt.select("Please Select Your Character Type:") do |menu|
        menu.choice "Elf", 1
        menu.choice "Dwarf", 2
        menu.choice "Warrior", 3
      end
end

def select_name
    puts ' '
    puts "Please enter the name of your character:"
    name = gets.chomp
    system 'clear'
    puts ' '
    puts "Welcome #{name}!"
    name
end

def explain_available_items
    puts ' '
    puts "You are about to embark on a quest for the Legendary Ruby Gemstone!"
    puts "You have with you:"
    puts " - Sword"
    puts " - Bow and Arrows"
    puts " - Armour"
    puts ' '
    puts "Throughout the land you may be lucky enough to find:"
    puts " - Health Potions".colorize(:light_red).bold
    puts " - Extreme Health Potions".colorize(:magenta).bold
    puts " - Improved Armour".colorize(:blue).bold
    puts ' '
    puts "You're all set to begin your adventure!"
    puts ' '
    puts "<Press Enter to begin>"
    gets
end

def character_attack(enemy_health, damage)
    print "You delivered " 
    print "#{damage}".colorize(:white) 
    print " points of damage!"
    enemy_health = enemy_health - damage
    enemy_health
end

def enemy_attack(character_health, damage, enemy_attacks, enemy_type)
    puts "The #{enemy_type} attacked you with #{enemy_attacks.sample} and did #{damage} points of damage!"
    character_health = character_health - damage
    character_health
end

def display_info(enemy_health, character_health, enemy_type)
    puts '--' * 20
    puts ' '
    puts "#{enemy_type} Health: #{enemy_health}"
    puts "Your Health: #{character_health}"
    puts ' '
    puts '--' * 20
end

def check_if_gameover(lives)
    if lives == 0
        gameover
    end
end

def gameover
    puts 'You fought bravely, but unfortunately you have run out of lives.'
    puts 'Better luck next time!'
    exit
end

def ask_to_retry_or_quit
    puts 'Would you like to retry or exit:'
    input = gets.chomp.downcase
    if input == 'exit'
        exit
    end
end




actions = ["Use Sword", "Shoot Arrow", "Search Area"]
dragon_attacks = ['breath fire', 'tail whip', 'slash']
goblin_attacks = ['scratch', 'throw spear', 'bite']
troll_attacks = ['swing club', 'punch', 'stomp']
orc_attacks = ['sword attack', 'dagger attack', 'charge']

display_intro_message

character = Character.new(select_name, 'human', 100, 0, 0, 0, actions)
enemy = Enemy.new('Dragon', 150, 8)


character_confirmation = 'No'

while character_confirmation == 'No'
    system 'clear'
    character_choice = select_character(prompt)
    case character_choice
    when 1 
        character.update_elf_stats
    when 2 
        character.update_dwarf_stats
    when 3
        character.update_warrior_stats
    end
    character.display_character_info
    puts ' '
    character_confirmation = prompt.select('Are you happy with this choice?') do |menu|
        menu.choice "Yes"
        menu.choice "No"
      end
end

    system 'clear'
explain_available_items


#First Scene (Goblin)

while level == 1 && lives > 0
    display_goblin_intro
    enemy.update_goblin_stats
    character.restore_health(level)

    while enemy::enemy_health > 0 && character::character_health > 0
       
        input = prompt.select("Choose your action:") do |menu|
            menu.choice "Use Sword"
            menu.choice "Shoot Arrow"
            menu.choice "Search Area"
          end
        
        system 'clear'  
        puts ' '
        case input
        when "Use Sword"
            enemy::enemy_health = character_attack(enemy::enemy_health, character.generate_sword_damage)
            puts ' '    
        when "Shoot Arrow"
            enemy::enemy_health = character_attack(enemy::enemy_health, character.generate_archery_damage)
            puts ' '
        when "Search Area"
            character.search_area
        end

        if enemy::enemy_health > 0 then character::character_health = enemy_attack(character::character_health, enemy::generate_attack_damage - character::armour_rating, goblin_attacks, enemy::type) end
        puts ' '
        display_info(enemy::enemy_health, character::character_health, enemy::type)
    end



    if character::character_health > 0
        puts "Congratulations! You defeated the #{enemy::type}!"
        puts ' '
        puts '<Press Enter to Continue>'
        gets
        level += 1
    else 
        puts 'You lost!'
        lives -= 1
        check_if_gameover(lives)
        ask_to_retry_or_quit
    end
end

system 'clear'
display_first_path_choice
puts ' '
path = prompt.select("What path would you like to go down?") do |menu|
    menu.choice "Snowy Mountains", 1
    menu.choice "Valley", 2
  end


#Second Scene - Path 1 (Troll)

while level == 2 && lives > 0 && path == 1
    display_troll_intro
    enemy.update_troll_stats
    character.restore_health(level)
    

    while enemy::enemy_health > 0 && character::character_health > 0
        input = prompt.select("Choose your action:") do |menu|
            menu.choice "Use Sword"
            menu.choice "Shoot Arrow"
            menu.choice "Search Area"
          end
        system 'clear'  
        puts ' '
        case input
        when "Use Sword"
            enemy::enemy_health = character_attack(enemy::enemy_health, character.generate_sword_damage)
            puts ' '    
        when "Shoot Arrow"
            enemy::enemy_health = character_attack(enemy::enemy_health, character.generate_archery_damage)
            puts ' '
        when "Search Area"
            character.search_area
        end

        if enemy::enemy_health > 0 then character::character_health = enemy_attack(character::character_health, enemy::generate_attack_damage - character::armour_rating, troll_attacks, enemy::type) end
        puts ' '
        display_info(enemy::enemy_health, character::character_health, enemy::type)
    end


    if character::character_health > 0
        puts "Congratulations! You defeated the #{enemy::type}!"
        puts ' '
        puts '<Press Enter to Continue>'
        gets
        level += 1
    else 
        puts 'You lost!'
        lives -= 1
        check_if_gameover(lives)
        ask_to_retry_or_quit
    end
end

# #Second Scene - Path 2 (Orc)

while level == 2 && lives > 0 && path == 2
    display_orc_intro
    enemy.update_orc_stats
    character.restore_health(level)
    

    while enemy::enemy_health > 0 && character::character_health > 0
        input = prompt.select("Choose your action:") do |menu|
            menu.choice "Use Sword"
            menu.choice "Shoot Arrow"
            menu.choice "Search Area"
          end
        system 'clear'  
        puts ' '
        case input
        when "Use Sword"
            enemy::enemy_health = character_attack(enemy::enemy_health, character.generate_sword_damage)
            puts ' '    
        when "Shoot Arrow"
            enemy::enemy_health = character_attack(enemy::enemy_health, character.generate_archery_damage)
            puts ' '
        when "Search Area"
            character.search_area
        end

        if enemy::enemy_health > 0 then character::character_health = enemy_attack(character::character_health, enemy::generate_attack_damage - character::armour_rating, orc_attacks, enemy::type) end
        puts ' '
        display_info(enemy::enemy_health, character::character_health, enemy::type)
    end


    if character::character_health > 0
        puts "Congratulations! You defeated the #{enemy::type}!"
        puts ' '
        puts '<Press Enter to Continue>'
        gets
        level += 1
        path = 1
    else 
        puts 'You lost!'
        lives -= 1
        check_if_gameover(lives)
        ask_to_retry_or_quit
    end
end

#Third Scene - Path 1 (Witch)

while level == 3 && lives > 0 && path == 1
    system 'clear'
    display_witch_intro
    incorrect_answers = 0
    correct_answers = 0
    while incorrect_answers < 3 && correct_answers < 3
        puts ' '
        puts "Next Riddle:\n\n" unless incorrect_answers == 0 && correct_answers == 0
        riddle_selection = rand(1..4)
        case riddle_selection
        when 1 
            puts "What has legs but can't walk?"
            answer = gets.chomp.downcase.split
            puts answer
            puts ' '
            if answer.include?('chair')
                puts 'Correct!'
                correct_answers += 1
            elsif answer.include?('table')
                puts 'Correct!'
                correct_answers += 1
            else 
                puts 'Incorrect!'
                incorrect_answers += 1
            end
       
        when 2 
            puts "What goes away as soon as you talk about it?"
            answer = gets.chomp.downcase.split
            puts ' '
            if answer.include?('silence')
                puts 'Correct!'
                correct_answers += 1
            else 
                puts 'Incorrect! The correct answer was silence.'
                incorrect_answers += 1
            end

        when 3 
            puts "What has a bank but no money?"
            answer = gets.chomp.downcase.split
            puts ' '
            if answer.include?('river')
                puts 'Correct!'
                correct_answers += 1
            else 
                puts 'Incorrect! The correct answer was river.'
                incorrect_answers += 1
            end

        when 4 
            puts "It has keys, but no locks. \nIt has space, but no room. \nYou can enter, but you can't go inside.\nWhat is it?"
            answer = gets.chomp.downcase.split
            puts ' '
            if answer.include?('keyboard')
                puts 'Correct!'
                correct_answers += 1
            else 
                puts 'Incorrect! The correct answer was a keyboard.'
                incorrect_answers += 1
            end
        end
        puts ' '
        puts "Correct answers: #{correct_answers}"
        puts "Incorrect answers: #{incorrect_answers}"
        puts ' '
        puts '<Press Enter to Continue>'
        gets
        system 'clear' unless incorrect_answers == 3 || correct_answers == 3
    end

    if correct_answers == 3
    puts "Congratulations! You're solved the riddles!"
        level += 1
    else
        puts 'You lost!'
        lives -= 1
        check_if_gameover(lives)
        ask_to_retry_or_quit
    end
    system 'clear'
end

#Fourth and Final Scene (Dragon)

while level == 4 && lives > 0
    display_dragon_intro
    enemy.update_dragon_stats
    character.restore_health(level)
    

    while enemy::enemy_health > 0 && character::character_health > 0
        input = prompt.select("Choose your action:") do |menu|
            menu.choice "Use Sword"
            menu.choice "Shoot Arrow"
            menu.choice "Search Area"
          end
        system 'clear'  
        puts ' '
        case input
        when "Use Sword"
            enemy::enemy_health = character_attack(enemy::enemy_health, character.generate_sword_damage)
            puts ' '    
        when "Shoot Arrow"
            enemy::enemy_health = character_attack(enemy::enemy_health, character.generate_archery_damage)
            puts ' '
        when "Search Area"
            character.search_area
        end

        if enemy::enemy_health > 0 then character::character_health = enemy_attack(character::character_health, enemy::generate_attack_damage - character::armour_rating, dragon_attacks, enemy::type) end
        puts ' '
        display_info(enemy::enemy_health, character::character_health, enemy::type)
    end


    if character::character_health > 0
        puts "Congratulations! You defeated the #{enemy::type}!"
        puts ' '
        puts '<Press Enter to Continue>'
        gets
        level += 1
    else 
        puts 'You lost!'
        lives -= 1
        check_if_gameover(lives)
        ask_to_retry_or_quit
    end
end