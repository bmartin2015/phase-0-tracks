# Board game Library
# Tracks:
# Board game:
# 	Name
# 	Publisher
# 	Shelf
# 	Categories

# Shelf:
# 	Name

# Needs:
# Add boardgames, shelves <- DONE
# Update boardgames, shelves <- DONE
# Delete boardgames, shelves <- DONE
# List games by name <- DONE
# List shelves by name <- DONE
# List games by shelf <- DONE
# Menu system for navigation

# Required gems
require 'sqlite3'
require_relative 'menu'
require_relative 'boardgame'

# Initialize the database
db = SQLite3::Database.new("bg_tracker.db")
db.results_as_hash = true

# get list of boardgames from database
# input: database, string order_by (either board game or shelf)
# Note: order_by should be in format "ORDER BY boardgame.name" or "ORDER BY shelf.name"
# steps:
	# create sql string using table and hash
	# execute sql string
	# use results array to create hash of board game hashes with the name as the key
# output: hash of hashes
def get_boardgames(db, order_by="")
	boardgames = {}
	sql_str = "SELECT boardgames.id, boardgames.name, boardgames.publisher, boardgames.shelf_id, shelves.name AS shelf_name FROM boardgames, shelves WHERE boardgames.shelf_id = shelves.id #{order_by}"
	results = db.execute2(sql_str)
	headers = results.shift
	results.each do |array| # Setup the boardgames into a more user friendly hash of hashes with the name of the game as the key
		boardgames[array['name']] = {
			id: array['id'],
			"Name" => array['name'],
			"Publisher" => array['publisher'],
			shelf_id: array['shelf_id'],
			"Shelf" => array['shelf_name']
		}
	end
	boardgames # return the hash
end

# get list of shelves from database
# input: database
# steps:
	# create sql string using table and hash
	# execute sql string
	# use results array to create hash of shelf hashes with the name as the key
# output: hash of hashes
def get_shelves(db)
	shelves = {}
	sql_str = "SELECT * FROM shelves WHERE name != 'Default Shelf'"
	results = db.execute2(sql_str)
	headers = results.shift
	results.each do |array| # create a hash of hashes with the shelf name as the key
		shelves[array['name']] = {
			id: array['id'],
			"Name" => array['name']
		}
	end
	shelves # return the shelf
end


# add board game to database
# input: database, hash with keys 'name', 'publisher', :shelf_id
# steps:
	# create sql string using table and hash
	# execute sql string
# output: array
def add_boardgame(db, game)
	sql_str = "INSERT INTO boardgames (name, publisher, shelf_id) VALUES (?, ?, ?)"
	db.execute(sql_str, game['name'], game['publisher'], game[:shelf_id])
end

# update board game in database
# input: database, hash with keys 'name', 'publisher', :shelf_id
# steps:
	# create sql string using table and hash
	# execute sql string
# output: array
def edit_boardgame(db, id, game)
	value_arr = []
	sql_str = "UPDATE boardgames SET "
	game.each do |col, value|
		sql_str += "#{col} = ?, "
		value_arr << value
	end
	sql_str = sql_str.slice(0, sql_str.length-2)
	sql_str += " WHERE id = #{id}"
	# puts sql_str
	# puts value_arr
	db.execute(sql_str, value_arr)
end

# delete board game in database
# input: database, id of game to delete
# steps:
	# create sql string using id
	# execute sql string
# output: array
def delete_boardgame(db, id)
	sql_str = "DELETE FROM boardgames WHERE id = #{id}"
	db.execute(sql_str)
end

# add shelf to database
# input: database, string with name
# steps:
	# create sql string using table and string
	# execute sql string
# output: array
def add_shelf(db, name)
	sql_str = "INSERT INTO shelves (name) VALUES (?)"
	db.execute(sql_str, name)
end

# update shelf in database
# input: database, integer id, string with name, 
# steps:
	# create sql string using table and string
	# execute sql string
# output: array
def edit_shelf(db, id, name)
	sql_str = "UPDATE shelves SET name = ? WHERE id = ?"
	db.execute(sql_str, name, id)
end

# delete shelf in database
# input: database, id of game to delete
# steps:
	# create sql string using id
	# execute sql string
	# Update all boardgames to remove shelf_id = id
# output: array
def delete_shelf(db, id)
	default_shelf = "SELECT id FROM shelves WHERE name = 'Default Shelf'"
	results = db.execute(default_shelf)
	default_shelf_id = results[0]['id']
	boardgame_update = "UPDATE boardgames SET shelf_id = #{default_shelf_id} WHERE shelf_id = ?"
	db.execute(boardgame_update, id)
	# need to also remove the shelf_id from boardgames
	sql_str = "DELETE FROM shelves WHERE ID = ?"
	db.execute(sql_str, id)
end

# search the database for specific games (by name, or publisher)
# input: database, search string search type, 
# steps:
	# create sql string using the search type and string
	# execute sql string
	# RETURN the results as hash
# output: hash of hashes
def search_boardgames(db, search_string, search_type)
	boardgames = {}
	sql_str = "SELECT boardgames.id, boardgames.name, boardgames.publisher, boardgames.shelf_id, shelves.name AS shelf_name FROM boardgames, shelves WHERE boardgames.shelf_id = shelves.id AND #{search_type} LIKE '%' || ? || '%' ORDER BY boardgames.name"
	results = db.execute2(sql_str, search_string)
	headers = results.shift
	results.each do |array| # Setup the boardgames into a more user friendly hash of hashes with the name of the game as the key
		boardgames[array['name']] = {
			id: array['id'],
			"Name" => array['name'],
			"Publisher" => array['publisher'],
			shelf_id: array['shelf_id'],
			"Shelf" => array['shelf_name']
		}
	end
	boardgames # return the hash
end



boardgames = get_boardgames(db)
shelves = get_shelves(db)

menu = Menu.new(db)
menu.start