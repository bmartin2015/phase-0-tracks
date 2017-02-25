# Release 0
# Method that takes a block
def block_print
	puts "Before the block!"
	yield(10)
	puts "After the block!"
end

block_print {|x| puts "Counter: #{x}"}

num_array = [1, 2, 3, 4]

hollywood_toms = {
	tom_hanks: "Apollo 13",
	tom_hardy: "Mad Max: Fury Road",
	tom_cruise: "Top Gun"
}

# Testing .each on num_array
p num_array

num_array.each do |number|
	p number*number
end

# after .each
p num_array

# Teasting .map! on num_array
p num_array

num_array.map! do |number|
	p number
	number.next
end

# after. map!
p num_array


# Testing .each on hollywood_toms
p hollywood_toms

hollywood_toms.each do |name,movie|
	p "#{name} is known for #{movie}"
end

#after .each
p hollywood_toms