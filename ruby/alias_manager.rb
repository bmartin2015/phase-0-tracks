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