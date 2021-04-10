require 'colorize'

class Character
    attr_accessor :name, :character_type, :character_health, :actions, :sword_skill, :archery_skill, :armour_rating

    def initialize
        @name = 'Default'
        @character_type = 'Default'
        @character_health = 100
        @sword_skill = 0
        @archery_skill = 0
        @armour_rating = 0
    end

    def display_character_info
        puts ' '
        puts "Character Information:"
        puts "Type: #{@character_type}"
        puts "Health: #{@character_health}"
        puts "Sword Level: #{@sword_skill}"
        puts "Archery Level: #{@archery_skill}"
        puts "Armour Rating: #{@armour_rating}"
    end

    def select_name
        puts ' '
        puts "Please enter the name of your character:"
        @name = gets.chomp
        system 'clear'
        puts ' '
        puts "Welcome #{@name}!"
    end

    def update_elf_stats
        @character_type = 'Elf'
        @sword_skill = 2
        @archery_skill = 5
        @armour_rating = 2
    end

    def update_dwarf_stats
        @character_type = 'Dwarf'
        @sword_skill = 4
        @archery_skill = 1
        @armour_rating = 4
    end

    def update_warrior_stats
        @character_type = 'Warrior'
        @sword_skill = 3
        @archery_skill = 3
        @armour_rating = 3
    end

    def search_area
        search_number = rand(100)
        case search_number
        when (1..10)
            find_extreme_health_potion
        when (11..60)
            find_health_potion
        when (61..85)
            find_improved_armour
        when (86..100)
            puts "Sorry, you didn't find anything."
        end
    end

    def find_extreme_health_potion
        print "You found an " 
        print "Extreme Health Potion! ".colorize(:light_magenta) 
        print "Your health goes up by "
        puts "60.".colorize(:white)
        @character_health += 60
        begin
            raise MaximumHealthError if @character_health > 200
        rescue
            @character_health = 200
            puts "Health can't be more than 200."
        end
        puts "Your health is now at #{@character_health}."
        puts ' '
    end

    def find_health_potion
        print "You found a "
        print "Health Potion! ".colorize(:light_red) 
        print "Your health goes up by " 
        puts "30.".colorize(:white)
        @character_health += 30
        begin
            raise MaximumHealthError if @character_health > 200
        rescue
            @character_health = 200
            puts "Health can't be more than 200."
        end
        puts "Your health is now at #{@character_health}."
        puts ' '
    end

    def find_improved_armour
        print "You found some "
        print "improved armour! ".colorize(:light_blue)
        print "Your armour rating goes up by "
        puts "5.".colorize(:white)
        @armour_rating += 5
        begin
            raise MaximumArmourError if @armour_rating > 15
        rescue
            @armour_rating = 15
            puts "Armour rating can't be more than 15."
        end
        puts "Your new armour rating is #{@armour_rating}."
        puts ' '
    end

    def generate_sword_damage
        attack_damage = rand(30) + (@sword_skill * 2)
        attack_damage
    end

    def generate_archery_damage
        attack_damage = rand(30) + (@archery_skill * 2)
        attack_damage
    end

    def generate_spear_damage
        attack_damage = rand(10..40)
        attack_damage
    end

    def generate_battleaxe_damage
        attack_damage = rand(15..45)
        attack_damage
    end

    def restore_health(level)
        @character_health = 100 + (level * 10)
    end
end