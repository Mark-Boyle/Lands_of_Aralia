#Introduction
def display_intro_message
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

def get_name
    puts "Please enter the name of your character:"
    name = gets.chomp
    puts ' '
    puts "Welcome #{name}!"
end

def explain_available_items
    
    puts "You are about to embark on a quest for the Legendary Ruby Gemstone!"
    puts "You have with you:"
    puts " - A Sword"
    puts " - A Bow and some arrows"
    puts " - Armour with a rating of #{10}"
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

display_intro_message
get_name
explain_available_items

#First Scene