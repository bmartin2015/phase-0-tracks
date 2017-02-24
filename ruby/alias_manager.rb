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
# 	other edge cases? Such as an apostrophe

def next_vowel(letter)
	vowels = ["a", "e", "i", "o", "u"]
	if vowels.include?(letter)
		if vowels.index(letter) != (vowels.length - 1)
			next_vowel = vowels[vowels.index(letter)+1]
		else
			next_vowel = vowels[0]
		end
	end
	next_vowel
end

def next_consonant(letter)
	consonants = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]
	if consonants.include?(letter)
		if consonants.index(letter) != (consonants.length - 1)
			consonants = consonants[consonants.index(letter)+1]
		else
			consonants = consonants[0]
		end
	end
	consonants
end


test = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]
test.each do |x|
	p x
	p next_consonant(x)
end