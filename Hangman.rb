class Hangman
    attr_reader :incorrect_guesses, :bingo, :counter
    def initialize(word)
        @bingo = word.length
        @counter = 0
        word_lower = word.downcase
        @array_progress = []
        x = 0
        while x < word_lower.length
            @array_progress[x] = "__"
            x += 1
        end
        @array_all_letters =["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

        @array_word = word_lower.split(//)
        @hash = Hash.new
        y = 0
        while y < word_lower.length
            @hash[y] = @array_word[y]
            y += 1
        end

        @incorrect_guesses = 0
    end 

    def guess_letter(letter)
        if @array_all_letters.include? letter
            lower_letter = letter.downcase
            @array_all_letters.delete(lower_letter)
            if @array_word.include? lower_letter
                count = @array_word.count(lower_letter)
                edit_progress(count,lower_letter)
                puts "Match Found!"
            else
                puts "No Match. Try Again"
                @incorrect_guesses += 1
            end     
        else
            puts "Already used that letter. Pick Another"
        end 
    end

    def display 
        print "Available choices: #{@array_all_letters}"
        puts ""
        print "Current Progress: #{@array_progress}"
    end
    

    def edit_progress(count,letter) 
        i = 0
        until i == count
            @array_progress[@hash.key(letter)] = letter
            @hash.delete(@hash.key(letter))
            @counter += 1
            i += 1
        end
    end

end

puts "Warning, this game requires at least 2 people"

while true
    puts "Select from the following options: 
                Type 1 + Enter to Play Hangman 
                Type 2 + Enter to Quit"

    choice = gets.chomp

    case choice
    when "1"
        puts "Decide who will play Hangman and who will pick the word"
        puts "Once decided, please choose a word: "
        word = gets.chomp
        60.times {puts ""}
        hangman = Hangman.new(word)
        hangman.display
        puts ""
        puts "Start game. Player make a letter guess"
        guess = gets.chomp
        hangman.guess_letter(guess)
        hangman.display
        while true
            if hangman.incorrect_guesses == 7
                puts ""
                puts "Ran out of Attempts. Failed. Please Play Again"
                break
            else 
                if hangman.counter == hangman.bingo
                    puts " CONGRATULATIONS! YOU GUESSED THE RIGHT WORD"
                    break;
                else              
                    puts ""
                    puts "Make another guess, you have #{7-hangman.incorrect_guesses} attempts left"
                    newGuess = gets.chomp
                    hangman.guess_letter(newGuess)
                    hangman.display
                end
            end
        end
    when "2"
        puts "Goodbye"
        break;
    else
        puts "Invalid entry. Try Again"
    end
end

