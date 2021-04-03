def run_riddle_scene
    guesses_remaining = 3
    correct_answers = 0
    riddle_selection = rand(1..6)
    case riddle_selection
    when 1 
        puts "What has legs but can't walk?"
        answer = gets.chomp.downcase.split
        if answer.include?('chair')
            puts 'Correct!'
            correct_answers += 1
        elsif answer.include?('table')
            puts 'Correct!'
            correct_answers += 1
        else 
            puts 'Incorrect!'
            guesses_remaining -= 1
        end
    end

    riddle_selection = rand(1..6)
    case riddle_selection
    when 2 
        puts "What goes away as soon as you talk about it?"
        answer = gets.chomp.downcase.split
        if answer.include?('silence')
            puts 'Correct!'
            correct_answers += 1
        else 
            puts 'Incorrect! The correct answer was silence.'
            guesses_remaining -= 1
        end
    end
end