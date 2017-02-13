puts "What is your name?"
name = gets.chomp 

puts "How old are you?"
age = gets.chomp

puts "What year where your born?"
birth_year = gets.chomp

puts "Our company cafeteria serves garlic bread. Should we order some for you?"
garlic_bread = gets.chomp

puts "Would you like to enroll in the company’s health insurance?"
insurance = gets.chomp

vampire = false

age_calc = 2017 - birth_year.to_i

if age_calc != age.to_i
	age_correct = false
else
	age_correct = true
end

if garlic_bread == "yes" || garlic_bread == "Yes"
	garlic = true
else
	garlic = false
end

if insurance == "yes" || insurance == "Yes"
	ins = true
else
	ins = false
end

if name == "Drake Cula" || name == "Tu Fang"
	puts "Definitely a vampire."
elsif !age_correct && !garlic && ins
	puts "Almost certainly a vampire"
elsif !age_correct && (!garlic || !ins)
	puts "Probably a vampire."
elsif age_correct && garlic && ins
	puts "Probably not a vampire."
else
	puts "Results inconclusive."
end