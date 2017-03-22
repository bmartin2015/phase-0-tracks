# require gems
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end


# Release 0
# 1. A /contact route that displays an address (you can make up the address).
get '/contact' do
	address = "123 Main St.<br>New Canton, Zombieland 00005"
	address
end

# 2. A /great_job route that can take a person's name as a query parameter (not a route parameter) and say "Good job, [person's name]!". If the query parameter is not present, the route simply says "Good job!"
get '/great_job' do
	name = params[:name]
	if name
		"Goodo job, #{name}"
	else
		"Good job!"
	end
end

# 3. A route that uses route parameters to add two numbers and respond with the result. The data types are tricky here -- when will the data need to be (or arrive as) a string?
get '/add_numbers' do
	number_1 = params[:number_1].to_i
	number_2 = params[:number_2].to_i
	number_3 = number_1 + number_2
	number_3.to_s
end

# Release 1: Research On Your Own
# 1. Is Sinatra the only web app library in Ruby? What are some others?
# A. No, there are several Ruby web frameworks. There is Ruby on Rails, Merb, and Camping several and Padrino is another based on Sinatra.

# 2. Are SQLite and the sqlite3 gem your only options for using a database with Sinatra? What are some others?
# A. There are multiple gems to interface with databases. A quick search on Google essentially said that you can use almost any database gem. In addition, you can use DataMapper or ActiveRecord as an ORM to help make Sinatra applications database neutral. 

# 3. What is meant by the term web stack?
# A. It is the collection of software required to run web development. It might include the OS, server software, database and scripting language. 