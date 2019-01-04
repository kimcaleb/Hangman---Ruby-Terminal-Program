class Hangman
    attr_reader :incorrect_guesses
    def initialize(word)
       
        @array_progress = []
        x = 0
        while x < word.length
            @array_progress[x] = "__"
            x += 1
        end

        @array_all_letters =["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
        
        @array_word = word.split(//)
        @hash = Hash.new
        y = 0
        while y < word.length
            @hash[y] = @array_word[y]
            y += 1
        end

        @incorrect_guesses = 0
    end 

    def guess_letter(letter)
        lower_letter = letter.downcase
        if @incorrect_guesses == 7
            puts "Ran out of Attempts. Failed. Please Play Again"
        else
            @array_all_letters.delete(lower_letter)
            if @array_word.include? lower_letter
                count = @array_word.count(lower_letter)
                edit_progress(count,lower_letter)
                puts "Match Found!"
            else
                puts "No Match. Try Again"
                @incorrect_guesses += 1
            end
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
        puts "Decide who will play Hangman and who will be the Judge"
        puts "Once decided, Judge, guess a word: "
        word = gets.chomp
        hangman = Hangman.new(word)
        hangman.display
        puts ""
        puts "Start game. Player make a letter guess"
        guess = gets.chomp
        hangman.guess_letter(guess)
        hangman.display
        while true
            if hangman.incorrect_guesses == 7
                break
            else
                puts ""
                puts "Make another guess, you have #{7-hangman.incorrect_guesses} attemps left"
                newGuess = gets.chomp
                hangman.guess_letter(newGuess)
                hangman.display
            end
        end
    when "2"
        puts "Goodbye"
        break;
    else
        puts "Invalid entry. Try Again"
    end
end

