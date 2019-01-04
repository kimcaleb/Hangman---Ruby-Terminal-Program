

puts "Warning, this game requires at least 2 people"

while true
    puts "Select from the following options: 
                Type 1 + Enter to Play Hangman 
                Type 2 + Enter to Quit"

    choice = gets.chomp

    case choice
    when "1"

    end



end


class Hangman
    attr_reader :array_all_letters, :array_progress
    def initialize(word)
        x = 0
        while x < word.length
            @array_progress[x] = "__"
        end
        @array_all_letters =["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

    end 

end