require_relative('character')
require_relative('enemy')

level = 1
lives = 3

#Introduction
def display_intro_message
    system 'clear'
    puts ' '
    puts 'Welcome to the Adventure Game!!'
    puts ' '
    puts 'The Lands of Azalia are a beautiful yet dangerous place.'
    puts "Tales of the legendary Ruby Gemstone have lured many\ntreasure hunters into these lands."
    puts ' '
    puts 'It is a dangerous path filled with many challenges to overcome.'
    puts "But it is said that this Ruby Gemstone is more beautiful than the \nmind can comprehend."
    puts ' '
    puts "One brave, adventurous soul has set out on a quest\nto find it!"
    puts ' '
end


def select_character
    puts ' '
    puts "Please select your character:"
    gets.downcase
end

def select_name
    puts ' '
    puts "Please enter the name of your character:"
    name = gets.chomp
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
    puts " - Health Potions"
    puts " - Extreme Health Potions"
    puts " - Improved Armour"
    puts ' '
    puts "You're all set to begin your adventure!"
    puts ' '
    puts "<Press Enter to begin>"
    gets
end

def character_attack(enemy_health, damage)
    puts "You delivered #{damage} points of damage!"
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
    puts "Your Health #{character_health}"
    puts ' '
    puts '--' * 20
end

def display_enemy_intro
    system 'clear'
    puts ' '
    puts "An enemy appears in front of you."
    puts "It gives you an evil glare and a small smirk appears across it's face."
    puts "It comes charging at you!"
    puts ' '
end

def check_if_gameover(lives)
    if lives == 0
        gameover
    end
end

def gameover
    puts 'You fought bravely, but unfortunately you have run out of lives.'
    puts 'Better Luck next time!'
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

display_intro_message

character = Character.new(select_name, 'human', 100, 0, 0, 0, actions)
enemy = Enemy.new('Dragon', 150, 8)


select_character
character.update_elf_stats
character.display_character_info
explain_available_items


#First Scene (Goblin)
display_enemy_intro
while level == 1 && lives > 0
    enemy.update_goblin_stats
    character.restore_health(level)

    while enemy::enemy_health > 0 && character::character_health > 0
        puts "Choose your action:"
        input = gets.chomp
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

#Second Scene (Troll)
display_enemy_intro
while level == 2 && lives > 0
    enemy.update_troll_stats
    character.restore_health(level)
    

    while enemy::enemy_health > 0 && character::character_health > 0
        puts "Choose your action:"
        input = gets.chomp
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

#Third Scene (Dragon)
display_enemy_intro
while level == 3 && lives > 0
    enemy.update_dragon_stats
    character.restore_health(level)
    

    while enemy::enemy_health > 0 && character::character_health > 0
        puts "Choose your action:"
        input = gets.chomp
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