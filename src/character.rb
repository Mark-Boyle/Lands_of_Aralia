class Character
    attr_accessor :name, :character_type, :character_health, :actions, :archery_skill, :armour_rating

    def initialize (name, character_type, character_health, sword_skill, archery_skill, armour_rating, actions)
        @name = name
        @character_type = character_type
        @character_health =character_health
        @sword_skill = sword_skill
        @archery_skill = archery_skill
        @armour_rating = armour_rating
        @actions = actions
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

    def update_elf_stats
        @character_type = 'Elf'
        @character_health = character_health
        @sword_skill = 2
        @archery_skill = 5
        @armour_rating = 2
    end

    def update_dwarf_stats
        @character_type = 'Dwarf'
        @character_health = character_health
        @sword_skill = 4
        @archery_skill = 1
        @armour_rating = 4
    end

    def update_warrior_stats
        @character_type = 'Warrior'
        @character_health = character_health
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
        puts "You found an Extreme Health Potion! Your health goes up by 50."
        @character_health += 50
        puts "Your health is now at #{@character_health}"
        puts ' '
    end

    def find_health_potion
        puts "You found a Health Potion! Your health goes up by 25."
        @character_health += 25
        puts "Your health is now at #{@character_health}"
        puts ' '
    end

    def find_improved_armour
        puts "You found some better armour! Your armour rating goes up by 5."
        @armour_rating += 5
        puts "Your new armour rating is #{@armour_rating}"
        puts ' '
    end

    def generate_sword_damage
        attack_damage = rand(30) + (@sword_skill * 3)
        attack_damage
    end

    def generate_archery_damage
        attack_damage = rand(30) + (@archery_skill * 3)
        attack_damage
    end

    def restore_health(level)
        @character_health = 100 + (level * 10)
    end
end