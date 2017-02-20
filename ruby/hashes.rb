# PSEUDOCODE
# -Initialize hash
# -Ask user for each of the following and add to hash
#  -Name (string)
#  -Age (int)
#  -number of children (int)
#  -decor theme (string)
#  -number of rooms (int)
#  -wheelchair accessible (bool)
#  	-Convert to bool
#  -pets (bool)
#  	-Convert to bool
# -Print out hash in user readable format - use method
#  -create array of key names
#  -loop through array to print string versions of key names and key values
#  -if key_name == :favorite_colors
#   -use different puts to print the values as strings, not array.
# -Prompt user to enter in key name for any errors, 'none' if none
#  -Until none
#   -ask for key name
#   -convert key name to symbol
#   -ask for updated information and store in key
# -Print hash and exit

# BUSINESS LOGIC

# We need to print the hash at least twice, so it might as well be a method. I really aught not use puts in the method, but it seems to work best at the moment.
def print_hash(hash_name)
	hash_array = hash_name.keys
	hash_count = 0
	until hash_count == hash_array.length
		key_name = hash_array[hash_count]
		if key_name == :favorite_colors
			puts "#{key_name.to_s}: #{hash_name[key_name][0]}, #{hash_name[key_name][1]}, #{hash_name[key_name][2]}"
		else
			puts "#{key_name.to_s}: #{hash_name[key_name]}"
		end
		hash_count += 1
	end
end


# Initialize hash
client_info = Hash.new

# For Testing - so I didn't have to enter in everything every time I was testing code
# client_info = {name: "Ben",	age: 22, children_count: 2,	decor_theme: "Emo",	room_count: 3,	wheelchair_accessible: true, pet: false }

# Ask for user input
puts "Please enter client name:"
client_info[:name] = gets.chomp

puts "Please enter client age:"
client_info[:age] = gets.chomp.to_i # convert to int

puts "Please enter number of children client has:"
client_info[:children_count] = gets.chomp.to_i # convert to int

puts "Please enter decor theme:"
client_info[:decor_theme] = gets.chomp

puts "Please enter number of rooms being designed:"
client_info[:room_count] = gets.chomp.to_i # convert to int

puts "Does the design need to be wheelchair accessible? ('y' or 'n')"
wc_accessible = gets.chomp

# Convert to a bool
if wc_accessible == "y" || wc_accessible == "Y"
	client_info[:wheelchair_accessible] = true
else
	client_info[:wheelchair_accessible] = false
end

puts "Does the client have pets? ('y' or 'n')"
pets = gets.chomp

# Convert to a bool
if pets == "y" || pets == "Y"
	client_info[:pet] = true
else
	client_info[:pet] = false
end


# Print out the existing hash information
print_hash(client_info)

# Ask if there is anything that should be changed and loop until the user types none
field = ""
until field == "none"
	puts "Enter name of field if you need to change anything or type 'none' if not:"
	field = gets.chomp
	if field != "none"
		# This code will convert the change into the correct type. It could probably be re-factored into a method.
		puts "What value would you like it to be?"
		change = gets.chomp
		if field == "age" || field == "children_count" || field == "room_count"
			change = change.to_i
		elsif field == "wheelchair_accessible" || field == "pet"
			if change == "y" || change == "Y"
				change = true
			else
				change = false
			end
		end
	client_info[field.to_sym] = change # need to use to_s to make the string into a symbol
	end
end

# print the hash one last time before exiting
print_hash(client_info)

# Testing - will print out the hash in a raw format and also the keys
# p client_info
# p client_info.keys