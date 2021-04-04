require_relative('index')


def run_riddle_scene
    guesses_remaining = 3
    correct_answers = 0
    while guesses_remaining > 0 && correct_answers < 3
        riddle_selection = rand(1..2)
        puts "Guesses remaining: #{guesses_remaining}"
        puts "Correct answers: #{correct_answers}"
        case riddle_selection
        when 1 
            puts "What has legs but can't walk?"
            answer = gets.chomp.downcase.split
            puts answer
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
        # end

        # riddle_selection = rand(1..6)
        # case riddle_selection
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
        puts 'end of riddle'
        puts "Guesses remaining: #{guesses_remaining}"
        puts "Correct answers: #{correct_answers}"
        gets
    end

    if guesses_remaining > 0
    puts "Congratulations! You're solved the riddles!"
        level += 1
    else
        puts 'You lost!'
        lives -= 1
        check_if_gameover(lives)
        ask_to_retry_or_quit
    end
end