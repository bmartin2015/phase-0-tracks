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
# Update boardgames, shelves
# Delete boardgames, shelves
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
# input: database, string order_by (either boardgame or shelf)
# Note: order_by should be in format "ORDER BY boardgame.name" or "ORDER BY shelf.name"
# steps:
	# create sql string using table and hash
	# execute sql string
	# use results array to create hash of boardgame hashes with the name as the key
# output: hash of hashes
def get_boardgames(db, order_by="")
	boardgames = {}
	test = {}
	sql_str = "SELECT boardgames.id, boardgames.name, boardgames.publisher, boardgames.shelf_id, shelves.name AS shelf_name FROM boardgames, shelves WHERE boardgames.shelf_id = shelves.id #{order_by}"
	results = db.execute2(sql_str)
	headers = results.shift
	results.each do |array|
		boardgames[array['name']] = {
			id: array['id'],
			"Name" => array['name'],
			"Publisher" => array['publisher'],
			shelf_id: array['shelf_id'],
			"Shelf" => array['shelf_name']
		}
#		test[array['name']] = Boardgame.new(array['id'], array['name'], array['publisher'], array['shelf_id'])
	end
#	p test
	boardgames
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
	sql_str = "SELECT * FROM shelves"
	results = db.execute2(sql_str)
	headers = results.shift
	results.each do |array|
		shelves[array['name']] = {
			id: array['id'],
			"Name" => array['name']
		}
	end
	shelves
end


# add boardgame to database
# input: database, hash with keys 'name', 'publisher', :shelf_id
# steps:
	# create sql string using table and hash
	# execute sql string
# output: array
def add_boardgame(db, game)
	sql_str = "INSERT INTO boardgames (name, publisher, shelf_id) VALUES (?, ?, ?)"
	db.execute(sql_str, game['name'], game['publisher'], game[:shelf_id])
end

# update boardgame in database
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

# delete boardgame in database
# input: database, id of game to delete
# steps:
	# create sql string using id
	# execute sql string
# output: array
def delete_boardgame(db, id)
	sql_str = "DELETE FROM boardgames WHERE id = #{id}"
	db.execute(sql_str)
end

boardgames = get_boardgames(db)
shelves = get_shelves(db)

menu = Menu.new(db)
# puts menu.list_games(boardgames, ["Name", "Publisher", "Shelf"])


# puts menu.list_games(shelves, ["Name"])

# boardgames_2 = get_boardgames(db, "ORDER BY shelves.name")
# puts menu.list_games(boardgames_2, ["Shelf", "Name", "Publisher"])

#menu.start

menu.edit_game(boardgames)