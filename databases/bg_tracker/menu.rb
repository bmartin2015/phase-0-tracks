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
end