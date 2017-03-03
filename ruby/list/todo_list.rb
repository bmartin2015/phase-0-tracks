class TodoList
	attr_accessor :todo_list

	def initialize(list)
		# store the to do list
		@todo_list = list
	end

	# passed first test
	def get_items
		todo_list
	end

	# add item to the list
	def add_item(item)
		todo_list.push(item)
	end

	# delete item from the list
	def delete_item(item)
		todo_list.delete_if {|current_item| current_item == item }
	end

	# get item by index
	def get_item(index)
		todo_list[index]
	end
end
