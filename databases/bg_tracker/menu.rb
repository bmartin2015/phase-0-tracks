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
end