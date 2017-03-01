class Santa
	# getter methods
	attr_reader :age, :ethnicity

	# setter method
	attr_accessor :gender

	def speak()
		puts "Ho, ho, ho! Haaaappy holidays!"
	end

	def eat_milk_and_cookies(cookie)
		puts "That was a good #{cookie}"
	end

	def initialize(gender, ethnicity)
		puts "initializing Santa instance..."
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = 0
	end

	# setter methods
	def celebrate_birthday
		@age += 1
	end

	def gets_mad_at(reindeer)
		index = @reindeer_ranking.index(reindeer)
		@reindeer_ranking << @reindeer_ranking.delete_at(index)
	end
end

# Test Code - Release 0
# my_santa = Santa.new
# my_santa.speak()
# my_santa.eat_milk_and_cookies("thin mint")

# Test Code - Release 1 - add diverse initializations
santas = []
example_genders = ["male", "female", "agender", "third gender", "genderqueer", "nonbinary", "gender fluid"]
example_ethnicities = ["afro-latino", "white", "prefer not to say", "inhuman", "Spartoi", "kree", "mutant"]

example_genders.length.times do |i|
  santas << Santa.new(example_genders[i], example_ethnicities[i])
end

santas.each do |santa|
	puts santa.age
	santa.celebrate_birthday
	santa.gets_mad_at("Vixen")
	santa.gender = "unknown"
	puts santa.age
	puts santa.ethnicity
end