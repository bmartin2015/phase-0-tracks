puts "What is the hamsters name?"
hamster_name = gets.chomp

puts "What is the volume level? (1-10)"
volume_level = gets.chomp.to_i

puts "What is the fur color?"
fur_color = gets.chomp

puts "Is the hamster a candidate for adoption? (y/n)"
adoption = gets.chomp
if adoption == "yes" || adoption == "y"
	adoption = true
else
	adoption = false
end

puts "What is the estimated age?"
estimated_age = gets.chomp.to_i


if estimated_age == 0
	estimated_age = nil
end


puts "Hamster name: #{hamster_name}"
puts "Volume level: #{volume_level}"
puts "Fur color: #{fur_color}"
puts "Adoption desirability: #{adoption}"
puts "Estimated age: #{estimated_age}"