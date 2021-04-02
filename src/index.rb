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
    gets.chomp
end