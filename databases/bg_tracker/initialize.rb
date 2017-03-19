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

db.execute(create_boardgames_table)
db.execute(create_shelves_table)

shelves = ["Default Shelf", "Top Shelf", "Middle Shelf", "Bottom Shelf"]
games = [["Teen Titans", "DC Comics", 2], ["One Night Vampire", "bezier games", 2], ["Terra Mystica", "zman", 3], ["Random Encounters", "Other People Games", 4], ["Betrayal at House on the Hill", "Wizards of the Coast", 2]]

games.each do |arr|
	sql_str = "INSERT INTO boardgames (name, publisher, shelf_id) VALUES (?, ?, ?)"
	db.execute(sql_str, arr[0], arr[1], arr[2])
end

shelves.each do |arr|
	sql_str = "INSERT INTO shelves (name) VALUES (?)"
	db.execute(sql_str, arr)
end