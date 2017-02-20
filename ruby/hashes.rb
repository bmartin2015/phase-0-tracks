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
#  -three favorite colors (array of strings)
#  	-Convert to array
# -Print out hash in user readable format
# -Prompt user to enter in key name for any errors, 'none' if none
#  -Until none
#   -ask for key name
#   -convert key name to symbol
#   -ask for updated information and store in key
# -Print hash and exit

# BUSINESS LOGIC
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
#client_info = Hash.new

# For Testing
client_info = {name: "Ben",	age: 22, children_count: 2,	decor_theme: "Emo",	room_count: 3,	wheelchair_accessible: true, pet: false, favorite_colors: ["blue", "black", "grey"] }

=begin
# Ask for user input
puts "Please enter client name:"
client_info[:name] = gets.chomp

puts "Please enter client age:"
client_info[:age] = gets.chomp.to_i

puts "Please enter number of children client has:"
client_info[:children_count] = gets.chomp.to_i

puts "Please enter decor theme:"
client_info[:decor_theme] = gets.chomp

puts "Please enter number of rooms being designed:"
client_info[:room_count] = gets.chomp.to_i

puts "Does the design need to be wheelchair accessible? ('y' or 'n')"
wc_accessible = gets.chomp
if wc_accessible == "y" || wc_accessible == "Y"
	client_info[:wheelchair_accessible] = true
else
	client_info[:wheelchair_accessible] = false
end

puts "Does the client have pets? ('y' or 'n')"
pets = gets.chomp
if pets == "y" || pets == "Y"
	client_info[:pet] = true
else
	client_info[:pet] = false
end

count = 1
colors = []
until count == 4
	puts "Favorite color #{count}:"
	colors << gets.chomp
	count += 1
end

client_info[:favorite_colors] = colors

=end
# Print out the existing hash information
print_hash(client_info)

# Ask if there is anything that should be changed
field = ""
until field == "none"
	puts "Enter name of field if you need to change anything or type 'none' if not:"
	field = gets.chomp
	if field != "none"
		puts "What value would you like to be?"
		change = gets.chomp
		client_info[field.to_sym] = change
	end
end
print_hash(client_info)






# Testing
p client_info
p client_info.keys