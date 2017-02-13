puts "How many employees will be processed?"
emp_count = gets.chomp.to_i

until emp_count == 0

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

	age_calc = 2017 - birth_year.to_i

	if age_calc != age.to_i
		age_correct = false
	else
		age_correct = true
	end

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

	if age_correct && garlic && ins
		vampire = "Probably not a vampire."
	end

	if !age_correct && (!garlic || !ins)
		vampire = "Probably a vampire."
	end

	if !age_correct && !garlic && !ins
		vampire = "Almost certainly a vampire"
	end

	if name == "Drake Cula" || name == "Tu Fang"
		vampire = "Definitely a vampire."
	end

	if vampire == ""
		vampire = "Results inconclusive."
	end

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