# MENU CLASS TO SUPPORT THE UI
class Menu
	def initialize(db)
		@db = db
		@header_text = <<-headtext
-------------------------------------------------------------------------
|  ____     ____    ______                      __                      |
| /\\  _`\\  /\\  _`\\ /\\__  _\\                    /\\ \\                     |
| \\ \\ \\L\\ \\\\ \\ \\L\\_\\/_/\\ \\/ _ __    __      ___\\ \\ \\/'\\      __   _ __  |
| \\ \\  _ <'\\ \\ \\L_L  \\ \\ \\/\\`'__\\/'__`\\   /'___\\ \\ , <    /'__`\\/\\`'__\\ |
|  \\ \\ \\L\\ \\\\ \\ \\/, \\ \\ \\ \\ \\ \\//\\ \\L\\.\\_/\\ \\__/\\ \\ \\\\`\\ /\\  __/\\ \\ \\/  |
|   \\ \\____/ \\ \\____/  \\ \\_\\ \\_\\\\ \\__/.\\_\\ \\____\\\\ \\_\\ \\_\\ \\____ \\ \\_\\  |
|    \\/___/   \\/___/    \\/_/\\/_/ \\/__/\\/_/\\/____/ \\/_/\\/_/\\/____/ \\/_/  |
|     BG Tracker                                   A Board Game Tracker |
|                                                         by Ben Martin |
-------------------------------------------------------------------------
headtext
	end

# make a list of choices and ask the user to pick one
# input: array of menu choices
# steps:
	# LOOP thru menu choices
		# Print menu item with a number
	# GET user input 
	# RETRUN text of the users choice
# output: array
	def menu_options(menu_array)
		counter = 1
		menu_array.each do |menu_item|
			puts "#{counter}) #{menu_item}"
			counter += 1
		end
		puts "Please select an option from above."
		choice = gets.chomp.to_i
		menu_array[choice-1]
	end

# List boardgames in a nice format
# input: hash of boardgames, array of headers
# steps:
	# 
# output: string of boardgames
	def list_games(boardgame_hash, header_array)
		output = ""
		header_lengths = {}
		header_array.each do |head|
			header_lengths[head] = 0
		end
		boardgame_hash.each do |game, game_info|
			header_lengths.each do |head, length|
				header_lengths[head] = game_info[head].length if game_info[head].length > length
			end
		end
		width = header_array.length * 5
		header_lengths.each {|x,y| width += y}
		output += "-" * (width+header_array.length+1) + "\n|"
		header_array.each {|head| output += head.center(header_lengths[head]+5) + "|"}
		output += "\n" + "-" * (width+header_array.length+1) + "\n|"
		boardgame_hash.each do |game, game_info|
			header_lengths.each do |name, length|
				output += game_info[name].ljust(length+5) + "|"
			end
			output+= "\n|"
		end
		output += "-" * (width+header_array.length-1) + "|"
	end


# Manage the games front end
# input: 
# steps:
	# get list of boardgames
	# print list of boardgames
	# print menu asking what the user wants to do
	# CASE add game - call add_game
	# CASE edit game - call edit game
	# CASE delete game - call delete game
	# ELSE exit back to main menu
# output: 
	def manage_games(order_by="ORDER BY boardgames.name")
		boardgames = get_boardgames(@db, order_by)
		puts "Board Game Management"
		puts list_games(boardgames, ["Name", "Publisher", "Shelf"])
		menu_opts = ["Sort Games by Name", "Sort Games by Publisher", "Sort Games by Shelf", "Add Game", "Edit Game", "Delete Game", "Back to Main Menu"]
		choice = menu_options(menu_opts)
		case choice

		when "Sort Games by Name"
			manage_games

		when "Sort Games by Publisher"
			manage_games("ORDER BY boardgames.publisher")

		when "Sort Games by Shelf"
			manage_games("ORDER BY shelves.name")

		when "Add Game"
			add_game

		when "Edit Game"
			edit_game(boardgames)

		when "Delete Game"
			delete_game(boardgames)
		end
	end

# Allows the user to add a game.
# input: none
# steps:
	# GET user input for Name
	# GET user input for Publisher
	# use menu_options on an array of shelf names to allow user to select a shelf
	# print confirmation
	# IF confirmed
		# add_boardgame to database
# output: 
	def add_game
		new_game = {}
		puts "I understand you want to add a new board game!"
		puts "What is the name of your game?"
		new_game['name'] = gets.chomp
		puts "Who is the publisher of your new game?"
		new_game['publisher'] = gets.chomp
		puts "Please use this list to select a shelf:"
		shelves = get_shelves(@db)
		shelf = menu_options(shelves.keys)
		new_game[:shelf_id] = shelves[shelf][:id]
		puts "Alright! I am adding #{new_game['name']} by #{new_game['publisher']} to #{shelf}. Is that correct?"
		if y_or_n
			add_boardgame(@db, new_game)
			puts "I have added your board game!"
		end
		manage_games
	end

# Allows the user to edit existing games
# input: hash of games
# steps:
	# Ask user which game they want to edit
	# Ask user which thing they want to edit
	# CASE Name
		# GET user input for Name
	# CASE publisher
		# GET user input for Publisher
	# CASE shelf
		# use menu_options on an array of shelf names to allow user to select a shelf
	# print confirmation
	# IF confirmed
		# add_boardgame to database
	# go back to games menu
# output: 
	def edit_game(boardgames)
		game_edit = {}
		game_choice = menu_options(boardgames.keys)
		id = boardgames[game_choice][:id]
		puts "I understand you want to edit #{game_choice}. What do you want to edit?"
		edit_choice = menu_options(["Name", "Publisher", "Shelf", "Never mind"]).downcase

		case edit_choice

		when "name", "publisher"
			puts "What do you want to update the #{edit_choice.downcase} to?"
			game_edit[edit_choice.downcase] = gets.chomp
			puts "I understand you want to update the #{edit_choice.downcase} of #{game_choice} to #{game_edit[edit_choice]}. Is that correct?"
			if y_or_n
				# need to write code to update the stuff
				edit_boardgame(@db, id, game_edit)
			end

		when "shelf"
			shelves = get_shelves(@db)
			puts "Please select a new shelf (or the same one if you want!)"
			shelf_choice = menu_options(shelves.keys)
			puts "I understand you want to update the shelf to #{shelf_choice}. Is that correct?"
			game_edit['shelf_id'] = shelves[shelf_choice][:id]
			if y_or_n
				#need to write code to update the stuff
				edit_boardgame(@db, id, game_edit)
			end
		end
		manage_games
	end

# Allow the user to delete a game
# input: hash of games
# steps:
	# Ask user which game they want to delete
	# Ask user which thing they want to edit
	# print confirmation
	# IF confirmed
		# delete the game from the database
	# go back to games menu
# output: 
	def delete_game(boardgames)
		puts "What game do you want to delete?"
		choice = menu_options(boardgames.keys)
		puts "I understand you want to delete #{choice}? Is that correct?"
		id = boardgames[choice][:id]
		if y_or_n
			puts "I have deleted that game."
			delete_boardgame(@db, id)
		end
		manage_games
	end

	#simple code to ask user for yes or no answer
	def y_or_n
		puts "Please answer [y]es or [n]:"
		answer = gets.chomp.downcase
		if answer == 'y' || answer == 'yes' || answer == '[y]es'
			true
		else
			false
		end
	end

# Manage the shelves front end
# input: 
# steps:
	# get list of shelves
	# print list of shelves
	# print menu asking what the user wants to do
	# CASE add shelf - call add_shelf
	# CASE edit shelf - call edit_shelf
	# CASE delete shelf - call delete_shelf
	# ELSE exit back to main menu
# output:
	def manage_shelves
		shelves = get_shelves(@db)
		puts "Shelf Management"
		puts list_games(shelves, ["Name"])
		shelves
		menu_opts = ["Add Shelf", "Edit Shelf", "Delete Shelf", "Back to Main Menu"]
		choice = menu_options(menu_opts)
		case choice

		when "Add Shelf"
			add_shelves

		when "Edit Shelf"
			edit_shelves(shelves)

		when "Delete Shelf"
			delete_shelves(shelves)
		end
	end

# Allows the user to add a shelf.
# input: none
# steps:
	# GET user input for Name
	# print confirmation
	# IF confirmed
		# add_shelf to database
# output: 
	def add_shelves
		puts "I understand you want to add a new shelf."
		puts "What is the name of your shelf?"
		new_shelf = gets.chomp
		puts "Alright! I am adding #{new_shelf} to your list of shelves. Is that correct?"
		if y_or_n
			add_shelf(@db, new_shelf)
			puts "I have added your shelf!"
		end
		manage_shelves
	end

# Allows the user to edit existing shelves
# input: hash of shelves
# steps:
	# Ask user which shelf they want to edit
	# GET user input for Name
	# print confirmation
	# IF confirmed
		# add_boardgame to database
	# go back to shelves menu
# output: 
	def edit_shelves(shelves)
		shelf_choice = menu_options(shelves.keys)
		id = shelves[shelf_choice][:id]
		puts "I understand you want to edit #{shelf_choice}. What do you want to update the name to?"
		shelf_name = gets.chomp
		puts "I understand you want to update the name of #{shelf_choice} to #{shelf_name}. Is that correct?"
		if y_or_n
			edit_shelf(@db, id, shelf_name)
		end
		manage_shelves
	end

# Allow the user to delete a shelf
# input: hash of shelves
# steps:
	# Ask user which shelf they want to delete
	# print confirmation
	# IF confirmed
		# delete the shelf from the database
	# go back to shelves menu
# output: 
	def delete_shelves(shelves)
		puts "What shelf do you want to delete?"
		choice = menu_options(shelves.keys)
		puts "I understand you want to delete #{choice}. All board games on that shelf will be removed. Is that correct?"
		id = shelves[choice][:id]
		if y_or_n
			puts "I have deleted the shelf."
			delete_shelf(@db, id)
		end
		manage_shelves
	end

# Allow the user to search game by name or publisher
# input: none
# steps:
	# Ask user if user want to search for game or publisher
	# Ask user for search sring
	# CALL search_boardgames
	# IF anything is found
		# display matching games
	# ELSE
		# print nothing found message
	# return to menu
# output: 
	def search_games
		puts "Would you like to search by name or by publisher?"
		choice = menu_options(["Name", "Publisher", "Back to Main Menu"])
		if choice != "Back to Main Menu"
			puts "Please tell me what to search for:"
			search_str = gets.chomp
			case choice

			when "Name"
				games = search_boardgames(@db, search_str, "boardgames.name")

			when "Publisher"
				games = search_boardgames(@db, search_str, "boardgames.publisher")
			end
			if games.empty? == false
				puts "I found the following games:"
				puts list_games(games, ["Name", "Publisher", "Shelf"])
			else
				puts "I didn't find any games that match your search."
			end
			search_games
		end
	end


	# DRIVER CODE
	def start()
		loop do
			puts @header_text
			menu_opts = ["Search Games", "Manage Games", "Manage Shelves", "Exit"]
			choice = menu_options(menu_opts)
			
			case choice
			when "Search Games"
				search_games

			when "Manage Games"
				manage_games

			when "Manage Shelves"
				manage_shelves
			else
				break
			end
		end
	end
end