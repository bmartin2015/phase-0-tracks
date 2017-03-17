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
# Add boardgames, shelves
# Update boardgames, shelves
# Delete boardgames, shelves
# List games by name <- DONE
# List shelves by name
# List games by categories
# List games by shelf
# Menu system for navigation

# Required gems
require 'sqlite3'
require_relative 'menu'
require_relative 'boardgame'

# Initialize the database
db = SQLite3::Database.new("bg_tracker.db")
db.results_as_hash = true

# get list of boardgames from database
# input: database
# steps:
	# create sql string using table and hash
	# execute sql string
	# use results array to create hash of boardgame hashes with the name as the key
# output: hash of hashes
def get_boardgames(db)
	boardgames = {}
	test = {}
	sql_str = "SELECT boardgames.id, boardgames.name, boardgames.publisher, boardgames.shelf_id, shelves.name AS shelf_name FROM boardgames, shelves WHERE boardgames.shelf_id = shelves.id"
	results = db.execute2(sql_str)
	headers = results.shift
	results.each do |array|
		boardgames[array['name']] = {
			id: array['id'],
			name: array['name'],
			publisher: array['publisher'],
			shelf_id: array['shelf_id'],
			shelf_name: array['shelf_name']
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
	# use results array to create hash of boardgame hashes with the name as the key
# output: hash of hashes
def get_shelves(db)
	shelves = {}
	sql_str = "SELECT * FROM shelves"
	results = db.execute2(sql_str)
	headers = results.shift
	results.each do |array|
		shelves[array['name']] = {
			id: array['id'],
			name: array['name']
		}
	end
	shelves
end


# add boardgame to database
# input: database, string name, string publisher, int shelf_id
# steps:
	# create sql string using table and hash
	# execute sql string
# output: array
def add_boardgame(db, name, publisher, shelf_id)
	sql_str = "INSERT INTO boardgames (name, publisher, shelf_id) VALUES (?, ?, ?)"
	db.execute(sql_str, name, publisher, shelf_id)
end


p boardgames = get_boardgames(db)

p get_shelves(db)