# PSUDOCODE for Word Game

# Get word/phrase to guess
# Calculate guesses (5 per letter)
# Initialize both guess and answer arrays

# Loop until out of guesses or answer is correct
# 	Print out feedback from guess array ("_ _ _ _ _") using "_" for unknown letters
# 	Get guess word
# 	If the guess is correct
# 		add letter to the guess array
# 	if guess is duplicate
# 		let user know it was already guessed, but don't deduct count
# 	If guess is wrong
# 		deduct 1 from guess count

# If the user won - print congratulatory message
# If the user lost - print taunting message


# class WordGame
class WordGame
	attr_reader :guess_count, :word_guess; :words_guessed; :word; :word_array

	# initialize method to setup new class
	# input: string
	# steps:
		# Convert string to array
		# Create second array with "_" for each letter in string
		# Create empty words_guessed array
		# Calculate total number of guesses allowed
	# output: instance of WordGame
	def initialize(word)
		@word = word
		@word_array = word.split("")
		@word_guess = Array.new(@word.length, "_")
		@words_guessed = []
		@guess_count = @word.length * 5
	end

	# Print out feedback from guess array ("_ _ _ _ _") using "_" for unknown letters
	# input: none
	# steps:
		# Convert array to string with space between each item
	# output: string
	def print_word
		word_string = ""
		@word_guess.each { |letter| word_string = word_string + letter + " " }
		return word_string.rstrip
	end

	# Guess word
	# input: string
	# steps:
		# create array from string guess
		# IF guessed word equals word return true
		# ELSE IF word in words_guessed return false
		# ELSE
			# LOOP guessed word as an array
				# IF word_array item equals guessed word item UPDATE letter in word guessed
			# ADD word to words_guessed
			# Subtract one from guess_count
			# return FALSE
	# output: bool
	def guess_word(guess)
		guess_array = guess.split("")

		# No penalty for duplicate words
		return false if @words_guessed.index(guess) != nil

		if guess == @word
			return true
		else
			guess_array.length.times do |index|
				if guess_array[index] == @word_array[index]
					@word_guess[index] = guess_array[index]
				end
			end
			@words_guessed << guess
			@guess_count -= 1
			return false
		end
	end

	# Print words guessed
	# input: none
	# steps:
		# make array of guessed words into string separated by commas
	# output: string
	def print_words_guessed
		return "Words Guessed: " + @words_guessed.join(", ")
	end
end

# DRIVER CODE

# Ask first user for word to guess
puts "What word would you like the other player to guess?"
word_to_guess = gets.chomp

# Loop until out of guesses or answer is correct
game = WordGame.new(word_to_guess)
game_over = false

until game_over == true || game.guess_count == 0
	puts "Guesses Left: #{game.guess_count}"
	puts game.print_word
	puts game.print_words_guessed
	puts "What word would you like to guess?"
	guess = gets.chomp
	game_over = game.guess_word(guess)
end

# If the user won - print congratulatory message
if game_over == true
	puts "You Won! YAYA!"
else # If the user lost - print taunting message
	puts "HAHA, you lost!"
end