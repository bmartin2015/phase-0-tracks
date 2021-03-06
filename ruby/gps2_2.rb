# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # put item list into a hash
  # set default quantity = 1
  # print the list to the console  -- method to print hash list
# output:  hash
def create_list(items)

	shopping_list ={}

	items.split(" ").each do |item|
		shopping_list[item] = 1
	end

	# will put a method call
	print_list(shopping_list)
	return shopping_list

end



# Method to add an item to a list
# input: list, item name, and optional quantity
# steps: add item/qty to the hash
	##
# output: hash
def add_item(shopping_list, item, quantity=1)

	shopping_list[item] = quantity
#	return shopping_list
end




# Method to remove an item from the list
# input: shopping list, item name
# steps: find item in the hash
# output:
def remove_item(shopping_list, item)

	shopping_list.delete(item)

end

# Method to update the quantity of an item
# input:  shopping_list, item, quantity
# steps: calls add_item
# output: hash
def update_qty(shopping_list, item, quantity)

	add_item(shopping_list, item, quantity)

end


# Method to print a list and make it look pretty
# input: shopping list
# steps: print 'shopping list' to make it nice
## loop through hash and print item: quantity
## add a blank line
# output: nil
def print_list(list)

	puts 'Shopping List'

	list.each {|item, quantity| puts "#{item}: #{quantity}"}
	
	puts ""

end



########### driver code:  

shopping_list = create_list('carrots apples cereal pizza')

add_item(shopping_list, 'lemonade', 2)

add_item(shopping_list, 'tomatoes', 3)

add_item(shopping_list, 'onions')

add_item(shopping_list, 'ice cream', 4)

print_list(shopping_list)

remove_item(shopping_list, 'lemonade')

update_qty(shopping_list, 'ice cream', 1)

print_list(shopping_list)




# Release 4 reflections #

# What did you learn about pseudocode from working on this challenge?
# There are several different ways to write and organize pseudocode and that taking a few minutes to use the psudocode to understand the problem can save time on the actual coding of the problem.

# What are the tradeoffs of using arrays and hashes for this challenge?
# You would either need to use an array of arrays or two arrays to store the item and quantity. In addition, an array would require additional code to to update item quantity (using .index(item)). It seems like a hash is a lot easier to use, since there is no risk of the quantity and items not being synced up.

# What does a method return?
# It will return what ever the last expression is. Most of our methods will return the hash, but the print_list method will return nil, since the last expression is is a puts. 


# What kind of things can you pass into methods as arguments?
# Arrays, strings, hashs, pretty much any data type, code blocks and other methods as well.

# How can you pass information between methods?
# You can either return the information back to be stored and passed to the next method or use a persistent data structure like an array or hash. 


# What concepts were solidified in this challenge, and what concepts are still confusing?
# I think that pusdocoding became much more organized and clear to me after this challenge. I also feel more clear on when to use a do and when to use {} in code blocks when refactoring code.