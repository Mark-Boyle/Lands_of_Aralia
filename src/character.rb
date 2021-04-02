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
        puts "Character Information:"
        puts "Type: #{@type}"
        puts "Health: #{@character_health}"
        puts "Sword: #{@sword_skill}"
        puts "Archery: #{@archery_skill}"
        puts "Armour: #{@armour_rating}"
    end

    def update_elf_stats
        @character_type = 'Elf'
        @character_health = character_health
        @sword_skill += 2
        @archery_skill += 5
        @armour_rating = armour_rating
    end

    def generate_sword_damage
        attack_damage = rand(30) + (@sword_skill * 2)
        attack_damage
    end

    def generate_archery_damage
        attack_damage = rand(30) + (@archery_skill * 2)
        attack_damage
    end
end