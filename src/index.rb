require_relative('character')
require_relative('enemy')
require_relative('storyline')
# require_relative('errors')
require 'tty-prompt'
require 'artii'
require 'colorized_string'
require 'colorize'
require 'rspec'

character = Character.new
enemy = Enemy.new

argument = ARGV[0]
ARGV.clear
case argument
when '--help', '-h'
    display_help_documentation
    exit
when '--elf', '-e'
    character.update_elf_stats
    character.display_character_info
    exit
when '--dwarf', '-d'
    character.update_dwarf_stats
    character.display_character_info
    exit
when '--warrior', '-w'
    character.update_warrior_stats
    character.display_character_info
    exit
end

prompt = TTY::Prompt.new

level = 1
lives = 3

#Introduction
def select_character(prompt)
    puts ' '
    prompt.select('Please Select Your Character Type:') do |menu|
        menu.choice 'Elf'
        menu.choice 'Dwarf'
        menu.choice 'Warrior'
    end
end

def character_attack(enemy_health, damage)
    print "You delivered " 
    print "#{damage}".colorize(:light_yellow) 
    print " points of damage!"
    enemy_health -= damage
end

def enemy_attack(character_health, damage, enemy_attacks, enemy_type)
    print "The #{enemy_type} attacked you with " 
    print "#{enemy_attacks.sample}".colorize(:cyan)
    print " and did "
    print "#{damage}".colorize(:light_yellow)
    print " points of damage!"
    character_health -= damage
end

def display_action_selection(level)
    prompt = TTY::Prompt.new
    prompt.select("Choose your action:") do |menu|
        menu.choice "Use Sword"
        menu.choice "Shoot Arrow"
        menu.choice "Search Area"
        if level > 1 then menu.choice "Throw Spear" end
        if level > 2 then menu.choice "Swing Battleaxe" end
    end
end

def display_info(enemy_health, character_health, enemy_type)
    puts '--' * 20
    puts ' '
    print "#{enemy_type} Health: "
    print "#{enemy_health}\n".colorize(:light_yellow)
    print "Your Health: "
    print "#{character_health}\n".colorize(:light_yellow)
    puts ' '
    puts '--' * 20
end

def display_level_info(level, lives, character, type, armour)
    puts "Level: #{level}       Lives: #{lives}       Character: #{character} (#{type})       Armour: #{armour}".colorize(:light_green)
    puts ""
end

def check_if_gameover(lives)
    gameover if lives == 0
end

def gameover
    puts 'You fought bravely, but unfortunately you have run out of lives.'
    puts 'Better luck next time!'
    exit
end

def ask_to_retry_or_quit
    prompt = TTY::Prompt.new
    input = prompt.select("Would you like to Try Again or Exit?:") do |menu|
        menu.choice "Try Again"
        menu.choice "Exit"
    end
    exit if input == 'Exit'
    system 'clear'
end

dragon_attacks = ['breath fire', 'tail whip', 'slash']
goblin_attacks = ['scratch', 'throw spear', 'bite']
troll_attacks = ['swing club', 'punch', 'stomp']
orc_attacks = ['sword attack', 'dagger attack', 'charge']

display_intro_message
character.select_name

character_confirmation = 'No'
while character_confirmation == 'No'
    system 'clear'
    character_choice = select_character(prompt)
    case character_choice
    when 'Elf' 
        character.update_elf_stats
    when 'Dwarf' 
        character.update_dwarf_stats
    when 'Warrior'
        character.update_warrior_stats
    end
    character.display_character_info
    puts ' '
    character_confirmation = prompt.select('Are you happy with this choice?') do |menu|
        menu.choice "Yes"
        menu.choice "No"
      end
end

explain_available_items(character::name)

#First Scene (Goblin)
while level == 1 && lives > 0
    display_level_info(level, lives, character::name, character::character_type, character::armour_rating)
    display_goblin_intro
    enemy.update_goblin_stats
    character.restore_health(level)

    while enemy::enemy_health > 0 && character::character_health > 0
        puts ' '
        input = display_action_selection(level)
        system 'clear'
        display_level_info(level, lives, character::name, character::character_type, character::armour_rating)
        puts ' '
        case input
        when "Use Sword"
            enemy::enemy_health = character_attack(enemy::enemy_health, character.generate_sword_damage)
            puts ' '    
        when "Shoot Arrow"
            enemy::enemy_health = character_attack(enemy::enemy_health, character.generate_archery_damage)
            puts ' '
        when "Throw Spear"
            enemy::enemy_health = character_attack(enemy::enemy_health, character.generate_spear_damage)
            puts ' '
        when "Swing Battleaxe"
            enemy::enemy_health = character_attack(enemy::enemy_health, character.generate_battleaxe_damage)
            puts ' '
        when "Search Area"
            character.search_area
        end

        begin
            raise HealthBelowZeroError if enemy::enemy_health < 0
        rescue
            enemy::enemy_health = 0
        end

        if enemy::enemy_health > 0 then character::character_health = enemy_attack(character::character_health, enemy::generate_attack_damage - character::armour_rating, goblin_attacks, enemy::type) end        
        begin
            raise HealthBelowZeroError if character::character_health < 0
        rescue
            character::character_health = 0
        end
        puts ' '
        display_info(enemy::enemy_health, character::character_health, enemy::type)
    end

    if character::character_health > 0
        display_victory_message(enemy::type)
        level += 1
        character.restore_health(level)
        display_level_1_victory
    else 
        a = Artii::Base.new
        puts a.asciify('Defeat!').colorize(:light_red)
        puts ' '
        puts 'You lost!'
        lives -= 1
        check_if_gameover(lives)
        ask_to_retry_or_quit
    end
end

system 'clear'
display_first_path_choice
puts ' '
path = process_first_path_choice
system 'clear'

#Second Scene - Path 1 (Troll)
while level == 2 && lives > 0 && path == 1
    display_level_info(level, lives, character::name, character::character_type, character::armour_rating)
    display_troll_intro
    enemy.update_troll_stats
    character.restore_health(level)

    while enemy::enemy_health > 0 && character::character_health > 0
        input = display_action_selection(level)
        system 'clear'  
        display_level_info(level, lives, character::name, character::character_type, character::armour_rating)
        puts ' '
        case input
        when "Use Sword"
            enemy::enemy_health = character_attack(enemy::enemy_health, character.generate_sword_damage)
            puts ' '    
        when "Shoot Arrow"
            enemy::enemy_health = character_attack(enemy::enemy_health, character.generate_archery_damage)
            puts ' '
        when "Throw Spear"
            enemy::enemy_health = character_attack(enemy::enemy_health, character.generate_spear_damage)
            puts ' '
        when "Swing Battleaxe"
            enemy::enemy_health = character_attack(enemy::enemy_health, character.generate_battleaxe_damage)
            puts ' '
        when "Search Area"
            character.search_area
        end

        begin
            raise HealthBelowZeroError if enemy::enemy_health < 0
            rescue
            enemy::enemy_health = 0
        end
        if enemy::enemy_health > 0 then character::character_health = enemy_attack(character::character_health, enemy::generate_attack_damage - character::armour_rating, troll_attacks, enemy::type) end
        begin
            raise HealthBelowZeroError if character::character_health < 0
            rescue
            character::character_health = 0
        end

        puts ' '
        display_info(enemy::enemy_health, character::character_health, enemy::type)
    end

    if character::character_health > 0
        display_victory_message(enemy::type)
        display_level_2_victory
        level += 1
    else 
        a = Artii::Base.new
        puts a.asciify('Defeat!').colorize(:light_red)
        puts ' '
        puts 'You lost!'
        lives -= 1
        check_if_gameover(lives)
        ask_to_retry_or_quit
    end
end

# #Second Scene - Path 2 (Orc)
while level == 2 && lives > 0 && path == 2
    display_level_info(level, lives, character::name, character::character_type, character::armour_rating)
    display_orc_intro
    enemy.update_orc_stats
    character.restore_health(level)
    
    while enemy::enemy_health > 0 && character::character_health > 0
        input = display_action_selection(level)
        system 'clear'  
        display_level_info(level, lives, character::name, character::character_type, character::armour_rating)
        puts ' '
        case input
        when "Use Sword"
            enemy::enemy_health = character_attack(enemy::enemy_health, character.generate_sword_damage)
            puts ' '    
        when "Shoot Arrow"
            enemy::enemy_health = character_attack(enemy::enemy_health, character.generate_archery_damage)
            puts ' '
        when "Throw Spear"
            enemy::enemy_health = character_attack(enemy::enemy_health, character.generate_spear_damage)
            puts ' '
        when "Swing Battleaxe"
            enemy::enemy_health = character_attack(enemy::enemy_health, character.generate_battleaxe_damage)
            puts ' '
        when "Search Area"
            character.search_area
        end

        begin
            raise HealthBelowZeroError if enemy::enemy_health < 0
        rescue
            enemy::enemy_health = 0
        end
        if enemy::enemy_health > 0 then character::character_health = enemy_attack(character::character_health, enemy::generate_attack_damage - character::armour_rating, orc_attacks, enemy::type) end
        
        begin
            raise HealthBelowZeroError if character::character_health < 0
        rescue
            character::character_health = 0
        end
        puts ' '
        display_info(enemy::enemy_health, character::character_health, enemy::type)
    end

    if character::character_health > 0
        display_victory_message(enemy::type)
        display_level_2_victory
        level += 1
    else 
        a = Artii::Base.new
        puts a.asciify('Defeat!').colorize(:light_red)
        puts ' '
        puts 'You lost!'
        lives -= 1
        check_if_gameover(lives)
        ask_to_retry_or_quit
    end
end

system 'clear'
display_second_path_choice
puts ' '
path = prompt.select("What path would you like to go down?") do |menu|
    menu.choice "River", 1
    menu.choice "Forest", 2
  end

#Third Scene - Path 1 (Witch)
while level == 3 && lives > 0 && path == 1
    system 'clear'
    display_level_info(level, lives, character::name, character::character_type, character::armour_rating)
    display_witch_intro
    incorrect_answers = 0
    correct_answers = 0
    riddle_number = [1, 2, 3, 4, 5, 6]
    while incorrect_answers < 3 && correct_answers < 3
        display_level_info(level, lives, character::name, character::character_type, character::armour_rating) unless incorrect_answers == 0 && correct_answers == 0
        puts ' '
        puts "Next Riddle:\n\n" unless incorrect_answers == 0 && correct_answers == 0       
        riddle_selection = riddle_number.sample
        riddle_number.delete(riddle_selection)
        case riddle_selection
        when 1 
            puts '--' * 20
            puts "What has legs but can't walk?"
            puts '--' * 20
            answer = gets.chomp.downcase.split
            puts ' '
            if answer.include?('chair')
                puts "Correct!".colorize(:green)
                correct_answers += 1
            elsif answer.include?('table')
                puts "Correct!".colorize(:green)
                correct_answers += 1
            else 
                puts "Incorrect!".colorize(:red) 
                puts ' '
                puts 'The correct answer was chair or table.'
                incorrect_answers += 1
            end
       
        when 2 
            puts '--' * 20
            puts "What goes away as soon as you talk about it?"
            puts '--' * 20
            answer = gets.chomp.downcase.split
            puts ' '
            if answer.include?('silence')
                puts "Correct!".colorize(:green)
                correct_answers += 1
            else 
                puts "Incorrect!".colorize(:red) 
                puts ' '
                puts 'The correct answer was silence.'
                incorrect_answers += 1
            end

        when 3 
            puts '--' * 20
            puts "What has a bank but no money?"
            puts '--' * 20
            answer = gets.chomp.downcase.split
            puts ' '
            if answer.include?('river')
                puts "Correct!".colorize(:green)
                correct_answers += 1
            else 
                puts "Incorrect!".colorize(:red) 
                puts ' '
                puts 'The correct answer was river.'
                incorrect_answers += 1
            end

        when 4
            puts '--' * 20
            puts "It has keys, but no locks. \nIt has space, but no room. \nYou can enter, but you can't go inside.\nWhat is it?"
            puts '--' * 20
            answer = gets.chomp.downcase.split
            puts ' '
            if answer.include?('keyboard')
                puts "Correct!".colorize(:green)
                correct_answers += 1
            else 
                puts "Incorrect!".colorize(:red) 
                puts ' '
                puts 'The correct answer was a keyboard.'
                incorrect_answers += 1
            end
        when 5
            puts '--' * 20
            puts "What has a head and a tail, but no body?"
            puts '--' * 20
            answer = gets.chomp.downcase.split
            puts ' '
            if answer.include?('coin')
                puts "Correct!".colorize(:green)
                correct_answers += 1
            else 
                puts "Incorrect!".colorize(:red)
                puts ' '
                puts 'The correct answer was coin.'
                incorrect_answers += 1
            end
        when 6 
            puts '--' * 20
            puts "What goes up but never comes down?"
            puts '--' * 20
            answer = gets.chomp.downcase.split
            puts ' '
            if answer.include?('age')
                puts "Correct!".colorize(:green)
                correct_answers += 1
            else 
                puts "Incorrect!".colorize(:red) 
                puts ' '
                puts 'The correct answer was age.'
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
        a = Artii::Base.new
        puts a.asciify('Victory!').colorize(:light_green)
        puts ' '
        puts "Congratulations! You're solved the riddles!"
        display_level_3_victory
        level += 1
    else
        a = Artii::Base.new
        puts a.asciify('Defeat!').colorize(:light_red)
        puts ' '
        puts 'You lost!'
        riddle_number = [1, 2, 3, 4, 5, 6]
        lives -= 1
        check_if_gameover(lives)
        ask_to_retry_or_quit
    end
    system 'clear'
end

#Third Scene - Path 2 (Leprechaun)
while level == 3 && lives > 0 && path == 2
    system 'clear'
    display_level_info(level, lives, character::name, character::character_type, character::armour_rating)
    display_leprechaun_intro
    incorrect_answers = 0
    correct_answers = 0
    math_problem_number = [1, 2, 3, 4, 5, 6]
    while incorrect_answers < 3 && correct_answers < 3
        display_level_info(level, lives, character::name, character::character_type, character::armour_rating) unless incorrect_answers == 0 && correct_answers == 0
        puts ' '
        puts "Next Problem:\n\n" unless incorrect_answers == 0 && correct_answers == 0
        
        problem_selection = math_problem_number.sample
        math_problem_number.delete(problem_selection)
        case problem_selection
        when 1 
            puts '--' * 20
            puts "A painting and a sculpture cost $1500 in total."
            puts "The painting costs $1000 more than the sculpture."
            puts "How much does the sculpture cost?"
            puts '--' * 20
            puts "<Enter number only (no dollar sign)>"
            answer = gets.chomp.to_i
            puts ' '
            if answer == 250
                puts "Correct!".colorize(:green)
                correct_answers += 1
            else 
                puts "Incorrect!".colorize(:red) 
                puts ' '
                puts 'The correct answer is 250.'
                incorrect_answers += 1
            end
       
        when 2 
            puts '--' * 20
            puts "When William was 8, his brother was half his age. \nNow, William is 14. How old is his brother?"
            puts '--' * 20
            answer = gets.chomp.to_i
            puts ' '
            if answer == 10
                puts "Correct!".colorize(:green)
                correct_answers += 1
            else 
                puts "Incorrect!".colorize(:red) 
                puts ' '
                puts 'The correct answer is 10.'
                incorrect_answers += 1
            end

        when 3 
            puts '--' * 20
            puts "On a farm there are sheep, goats and horses."
            puts "All the animals are sheep except for three. \nAll the animals are goats except for four. \nAll the animals are horses except for five."
            puts "How many goats are there?"
            puts '--' * 20
            answer = gets.chomp.to_i
            puts ' '
            if answer == 2
                puts "Correct!".colorize(:green)
                correct_answers += 1
            else 
                puts "Incorrect!".colorize(:red) 
                puts ' '
                puts 'The correct answer was 2.'
                incorrect_answers += 1
            end

        when 4
            puts '--' * 20
            puts "I am a three-digit number. \nMy first digit is 3 less than my second digit.\nMy second digit is 3 times bigger than the third digit. \nMy third digit is half as big as my first digit.\nWhat number am I?"
            puts '--' * 20
            answer = gets.chomp.to_i
            puts ' '
            if answer == 693
                puts "Correct!".colorize(:green)
                correct_answers += 1
            else 
                puts "Incorrect!".colorize(:red) 
                puts ' '
                puts 'The correct answer was 693.'
                incorrect_answers += 1
            end
        when 5
            puts '--' * 20
            puts "What is the square root of 196?"
            puts '--' * 20
            answer = gets.chomp.to_i
            puts ' '
            if answer == 14
                puts "Correct!".colorize(:green)
                correct_answers += 1
            else 
                puts "Incorrect!".colorize(:red)
                puts ' '
                puts 'The correct answer was 14.'
                incorrect_answers += 1
            end
        when 6 
            puts '--' * 20
            puts "There are a certain number of books on the bookshelf. \nI took away a book which is 6th from the right and 4th from the left. \nHow many books are still on the shelf?"
            puts '--' * 20
            answer = gets.chomp.to_i
            puts ' '
            if answer == 8
                puts "Correct!".colorize(:green)
                correct_answers += 1
            else 
                puts "Incorrect!".colorize(:red) 
                puts ' '
                puts 'The correct answer was 8.'
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
        a = Artii::Base.new
        puts a.asciify('Victory!').colorize(:light_green)
        puts ' '
        puts "Congratulations! You're solved the riddles!"
        display_level_3_victory
        level += 1
    else
        a = Artii::Base.new
        puts a.asciify('Defeat!').colorize(:light_red)
        puts ' '
        puts 'You lost!'
        riddle_number = [1, 2, 3, 4, 5, 6]
        lives -= 1
        check_if_gameover(lives)
        ask_to_retry_or_quit
    end
    system 'clear'
end

#Fourth and Final Scene (Dragon)
while level == 4 && lives > 0
    display_level_info(level, lives, character::name, character::character_type, character::armour_rating)
    display_dragon_intro
    enemy.update_dragon_stats
    character.restore_health(level)
    
    while enemy::enemy_health > 0 && character::character_health > 0
        input = display_action_selection(level)
        system 'clear'  
        display_level_info(level, lives, character::name, character::character_type, character::armour_rating)
        puts ' '
        case input
        when "Use Sword"
            enemy::enemy_health = character_attack(enemy::enemy_health, character.generate_sword_damage)
            puts ' '    
        when "Shoot Arrow"
            enemy::enemy_health = character_attack(enemy::enemy_health, character.generate_archery_damage)
            puts ' '
        when "Throw Spear"
            enemy::enemy_health = character_attack(enemy::enemy_health, character.generate_spear_damage)
            puts ' '
        when "Swing Battleaxe"
            enemy::enemy_health = character_attack(enemy::enemy_health, character.generate_battleaxe_damage)
            puts ' '
        when "Search Area"
            character.search_area
        end

        begin
            raise HealthBelowZeroError if enemy::enemy_health < 0
        rescue
            enemy::enemy_health = 0
        end

        if enemy::enemy_health > 0 then character::character_health = enemy_attack(character::character_health, enemy::generate_attack_damage - character::armour_rating, dragon_attacks, enemy::type) end

        begin
            raise HealthBelowZeroError if character::character_health < 0
        rescue
            character::character_health = 0
        end

        puts ' '
        display_info(enemy::enemy_health, character::character_health, enemy::type)
    end

    if character::character_health > 0
        display_victory_message(enemy::type)
        display_final_victory_message
        puts ' '
        exit
    else 
        a = Artii::Base.new
        puts a.asciify('Defeat!').colorize(:light_red)
        puts 'You lost!'
        lives -= 1
        check_if_gameover(lives)
        ask_to_retry_or_quit
    end
end 