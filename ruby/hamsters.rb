puts "What is the hamsters name?"
hamster_name = gets.chomp

puts "What is the volume level? (1-10)"
volume_level = gets.chomp

puts "What is the fur color?"
fur_color = gets.chomp

puts "Is the hamster a candidate for adoption?"
adoption = gets.chomp

puts "What is the estimated age?"
estimated_age = gets.chomp

if estimated_age == ""
	estimated_age = nil
else
	estimated_age = estimated_age
end