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

#Release 2

#A method that iterates through the items, deleting any that meet a certain condition 
letters = [ "A", "B", "C"]

letters.delete_if {|letters| letters == "B"}

p letters

x = { "first" => 1, "second" => 2, "third" => 3}
x.delete_if {|word, number| number >= 2}
p x 

#A method that filters a data structure for only items that satisfy a certain condition
numbers = [ 1, 5, 10, 12]
numbers.keep_if { |number| number >= 7}

p numbers	

new_x = { "first" => 1, "second" => 2, "third" => 3}
new_x.keep_if { |word, number| number == 3}
p new_x
#A different method than above
new_numbers = [ 1, 2 ,4, 6, 7]
new_numbers.select! { |new_number| new_number < 5}

p new_numbers

r = { "a" => "apple", "b" => "banana", "c" => "cantaloupe"}
r.select! {|letter, word| letter == "b"}
p r
#method that will remove items from a data structure until the condition in the block evaluates to false
more_numbers = [ 5, 10, 15, 20]
more_new_numbers = more_numbers.drop_while {|number| number < 15}

p more_numbers
p more_new_numbers

w = { 1 => "one", 2 => "two", 3 => "three"}
w.reject! {|number, name| number != 3}
p w 
