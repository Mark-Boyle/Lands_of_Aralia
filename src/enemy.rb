class Enemy
    attr_accessor :type, :enemy_health, :attacking_force

    def initialize(type, enemy_health, attacking_force)
        @type = type
        @enemy_health = enemy_health
        @attacking_force = attacking_force
    end

    def generate_attack_damage
       attack_damage = rand(10..40) + @attacking_force
       attack_damage
    end

    def update_goblin_stats
        @type = 'Goblin'
        @enemy_health = 70
        @attacking_force = 0
    end


end
