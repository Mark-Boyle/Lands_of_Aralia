class riddle
    attr_accessor :question, :answer, :guesses_remaining, :correct_answers

    def initialize(question, answer, guesses_remaining, correct_answers)
        @question = question
        @answer = answer
        @guesses_remaining = guesses_remaining
        @correct_answers = correct_answers
    end

    def run_riddle_question
        while guesses_remaining > 0 && correct_answers < 3
            puts "Guesses remaining: #{@guesses_remaining}"
            puts "Correct answers: #{@correct_answers}"
            puts "#{@question}"
            input = gets.chomp.downcase.split
            puts input
            if input.include?(@answer)
                puts 'Correct!'
                @correct_answers += 1
            else 
                puts 'Incorrect!'
                @guesses_remaining -= 1
            end
        end
    end
end