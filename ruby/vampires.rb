# vampires.rb 
# DBC 4.4 Solo Challenge

# Ask how many employees will be processed in each pass
puts "How many employees will be processed?"
emp_count = gets.chomp.to_i
x = 0

# Loop the code until all employees are processed.
until x >= emp_count

	puts "What is your name?"
	name = gets.chomp 

	puts "How old are you?"
	age = gets.chomp

	puts "What year were your born?"
	birth_year = gets.chomp

	puts "Our company cafeteria serves garlic bread. Should we order some for you?"
	garlic_bread = gets.chomp

	puts "Would you like to enroll in the company’s health insurance?"
	insurance = gets.chomp


	age_calc = 2017 - birth_year.to_i

	if age_calc != age.to_i
		age_correct = false
	else
		age_correct = true
	end

	# initialize a blank string for vampire
	vampire = String.new

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

	# if the user got all impute correct, they are probably not a vampire
	if age_correct && garlic && ins
		vampire = "Probably not a vampire."
	end

	# if the user did not get their age correct, and also didn't like garlic or insurance, they might be a vampire
	if !age_correct && (!garlic || !ins)
		vampire = "Probably a vampire."
	end

	# if user got all things wrong, they are a vampire
	if !age_correct && !garlic && !ins
		vampire = "Almost certainly a vampire"
	end

	# cross check for known vampires
	if name == "Drake Cula" || name == "Tu Fang"
		vampire = "Definitely a vampire."
	end

	# if none of the above are met, we just don't know
	if vampire == ""
		vampire = "Results inconclusive."
	end

	# check for allergies
	allergy = String.new
	puts "Please input allergies, one at time. Type done when finished."
	until allergy == "done"
		allergy = gets.chomp
		if allergy == "sunshine"
			vampire = "Probably a vampire."
			break
		end
	end

	puts vampire
	emp_count = emp_count - 1

end
puts "Actually, never mind! What does these questions have to do with anything? Let's all be friends."