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


# I would like to refactor these down, they seem really big
def next_vowel(letter)
	vowels = ["a", "e", "i", "o", "u"]
	uppercase = is_upcase?(letter)
	letter = letter.downcase
	if vowels.index(letter) != (vowels.length - 1)
		next_vowel = vowels[vowels.index(letter)+1]
	else
		next_vowel = vowels[0]
	end
	if uppercase
		next_vowel.upcase
	else
		next_vowel
	end
end

def next_consonant(letter)
	consonants = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]
	uppercase = is_upcase?(letter)
	letter = letter.downcase
	if consonants.include?(letter)
		if consonants.index(letter) != (consonants.length - 1)
			next_consonant = consonants[consonants.index(letter)+1]
		else
			next_consonant = consonants[0]
		end
	end
	if uppercase
		next_consonant.upcase
	else
		next_consonant
	end
end

# This is a quick and dirty way to see if a letter is upper case - it will return true or false
def is_upcase?(letter) 
	('A'..'Z').include?(letter)
end

def is_vowel?(letter)
	"aeiou".include?(letter.downcase)
end

def name_swap(name)
	# Split that name at spaces
	split_name = name.split(" ")

	# If the user has more than two names, it will leave them in the middle
	split_name[0], split_name[-1] = split_name[-1], split_name[0]
	return split_name
end

def alias_generator(real_name)
	alias_name = []	
	swapped_names = name_swap(real_name)
	swapped_names.each do |name|
		letters = name.split("")
		alias_letter = []
		letters.each do |letter|
			if is_vowel?(letter)
				next_letter = next_vowel(letter)
			else
				next_letter = next_consonant(letter)
			end
			if next_letter == nil
				alias_letter << ""
			else
				alias_letter << next_letter
			end
		end
		alias_name << alias_letter.join
	end
	alias_name.join(" ")
end

def alias_manager()
	agent_names = {}
	user_input = ""
	until user_input == "done" || user_input == "Done"
		puts "Please enter agent name or type 'done' to exit:"
		user_input = gets.chomp
		if user_input != "done"
			alias_name = alias_generator(user_input)
			puts "#{user_input} is #{alias_name}."
			agent_names[:user_input] = alias_name
		end
	end
end


alias_manager()
