# PSUDOCODE for Word Game

######DONE#######
# Get word/phrase to guess
# Calculate guesses (5 per letter)
# Initialize both guess and answer arrays
######DONE#######

# Loop until out of guesses or answer is correct
######DONE#######
# 	Print out feedback from guess array ("_ _ _ _ _") using "_" for unknown letters
######DONE#######

# 	Get guess word
# 	If the guess is correct
# 		add letter to the guess array
# 	if guess is duplicate
# 		let user know it was already guessed, but don't deduct count
# 	If guess is wrong
# 		let user know it was wrong and deduct 1 from guess count

# If the user won - print congratulatory message
# If the user lost - print taunting message

# initialize method to setup new class
# input: string
# steps:
	# Convert string to array
	# Create second array with "_" for each letter in string
	# Calculate total number of guesses allowed
# output: instance of WordGame
class WordGame
	attr_reader :word, :word_guess, :guess_count

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
		word_guess.each do |letter|
			word_string = word_string + letter + " "
		end
		return word_string.rstrip
	end
end

# Test code
# word_game = WordGame.new("test")
# p word_game.print_word