# Week 5.5 Solo Challenge

# Requirements:
# Swapping the first and last name.
# Changing all of the vowels (a, e, i, o, or u) to the next vowel in 'aeiou', and all of the consonants (everything else besides the vowels) to the next consonant in the alphabet. So 'a' would become 'e', 'u' would become 'a', and 'd' would become 'f'.

# PSUDOCODE - Release 0
# GET agent_name
# CALL swap_names - Swap the first and last name
# 	Split name at " " into array
# 	Swap first and last indexes
#  	JOIN array
# 	RETURN joined array
#
# CALL change_letters - shift each vowel to the next vowel
# 	Split name into array of letters
# 	IF letter is vowel
# 		SET letter to next vowel
# 	ELSE IF letter is consonant
#  		SET letter to next consonant
# 	JOIN array
# 	RETURN joined array
# 	PRINT alias name
#
# 	TODO:
# 	how do I handle uppercase vs lower case
# 		Test against the range ('A'..'Z')
# 	other edge cases? Such as an apostrophe

# Notes - Reworked after completing pairing session with .map!

# Swap the first and last name, will leave middles names in the middle
def name_swap(name)
	split_name = name.split(" ") # Split that name at spaces
	# If the user has more than two names, it will leave them in the middle
	split_name[0], split_name[-1] = split_name[-1], split_name[0]
	return split_name
end

# Return the next letter based on if vowel or not
def next_letter(letter)
	uppercase = is_upcase?(letter) # Test if letter is uppercase and remember
	letter = letter.downcase # make the letter lower case if it is not
	if "aeiou".include?(letter) # checks to see if a letter is a vowel
		vowels = ["a", "e", "i", "o", "u"]
		if vowels.index(letter) != (vowels.length - 1) 
			new_letter = vowels[vowels.index(letter)+1]
		else
			new_letter = vowels[0] # Change 'u' to 'a'
		end
	else
		consonants = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]
		if consonants.include?(letter)
			if consonants.index(letter) != (consonants.length - 1)
				new_letter = consonants[consonants.index(letter)+1]
			else
				new_letter = consonants[0] # Change 'z' to 'b'
			end
		end
	end
	# if the letter was upper case, upcase it
	if uppercase 
		new_letter.upcase
	else
		new_letter
	end
end

# This is a quick and dirty way to see if a letter is upper case - it will return true or false
def is_upcase?(letter) 
	('A'..'Z').include?(letter)
end

# This will run the methods needs to create one alias
def alias_generator(real_name)
	alias_name = []	# Blank array to hold the final names
	swapped_names = name_swap(real_name) # Swap the first and last name

	swapped_names.each do |name| # for each array index, change the letters
		letters = name.split("")
		alias_letter = []

		letters.map! do |letter| # for each letter in letters, change to the next letter
			new_letter = next_letter(letter)
			if new_letter == nil # if the value wasn't a letter (such as "'"), it will return nil
				""
			else
				new_letter
			end
		end
		alias_name << letters.join
	end
	alias_name.join(" ")
end


# this is the UI for the program
agent_names = {}
user_input = ""
until user_input == "done" || user_input == "Done"
	puts "Please enter agent name or type 'done' to exit:"
	user_input = gets.chomp
	if user_input != "done"
		alias_name = alias_generator(user_input)
		puts "#{user_input} is #{alias_name}."
		agent_names[user_input] = alias_name
	end
end
agent_names.each do |real_name, alias_name|
	puts "#{alias_name} is actually #{real_name}."
end