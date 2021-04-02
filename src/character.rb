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
end