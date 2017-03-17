# This is a is ruby code to initialize the database with some test data

require 'sqlite3'

db = SQLite3::Database.new("bg_tracker.db")
db.results_as_hash = true

create_boardgames_table = <<-table_sql
	CREATE TABLE boardgames (
		id INTEGER PRIMARY KEY,
		name VARCHAR(255),
		publisher VARCHAR(255),
		shelf_id INT,
		FOREIGN KEY (shelf_id) REFERENCES shelves(id)
	)
table_sql

create_shelves_table = <<-shelves_sql
	CREATE TABLE shelves (
		id INTEGER PRIMARY KEY,
		name VARCHAR(255)
	)
shelves_sql

create_categories_tables = <<-categories_sql
	CREATE TABLE categories (
		id INTEGER PRIMARY KEY,
		name VARCHAR(255)
	)
categories_sql

create_boardgames_categories_table = <<-boardgames_categories_sql
	CREATE TABLE boardgames_categories (
		boardgame_id INT,
		category_id INT,
		FOREIGN KEY (boardgame_id) REFERENCES boardgames(id),
		FOREIGN KEY (category_id) REFERENCES categories(id)
	)
boardgames_categories_sql

db.execute(create_boardgames_table)
db.execute(create_shelves_table)
db.execute(create_boardgames_categories_table)
db.execute(create_categories_tables)

shelves = ["Top Shelf", "Middle Shelf", "Bottom Shelf"]
categories = ["Bluff", "Deck Building", "Co Op", "Other"]

games = [["Teen Titans", "DC Comics", 1], ["One Night Vampire", "bezier games", 2], ["Terra Mystica", "zman", 3], ["Random Encounters", "Other People Games", 1], ["Betrayal at House on the Hill", "Wizards of the Coast", 2]]
boardgames_categories = [[1,2], [2,1], [4,3], [4,4], [3,4]]

def easy_mode(db, table, things)
	sql_str = "INSERT INTO #{table} (name) VALUES (?)"
	things.each do |thing|
		db.execute(sql_str, thing)
	end
end

games.each do |arr|
	sql_str = "INSERT INTO boardgames (name, publisher, shelf_id) VALUES (?, ?, ?)"
	db.execute(sql_str, arr[0], arr[1], arr[2])
end

boardgames_categories.each do |bgc|
	bgc_str = "INSERT INTO boardgames_categories (boardgame_id, category_id) VALUES (?, ?)"
	db.execute(bgc_str, bgc[0], bgc[1])
end

easy_mode(db, "shelves", shelves)
easy_mode(db, "categories", categories)