class Santa
	# Notes - added gender to attr_reader and age to Initialize.

	# getter methods
	attr_reader :age, :ethnicity, :gender

	# setter method
	attr_accessor :gender

	def initialize(gender, ethnicity, age)
		# initialize the class
		puts "initializing Santa instance..."
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = age
	end

	def speak()
		puts "Ho, ho, ho! Haaaappy holidays!"
	end

	def eat_milk_and_cookies(cookie)
		puts "That was a good #{cookie}"
	end

	def celebrate_birthday
		@age += 1
	end

	def gets_mad_at(reindeer)
		index = @reindeer_ranking.index(reindeer)
		@reindeer_ranking << @reindeer_ranking.delete_at(index)
	end

# Old setter and getter methods
#	def gender=(gender)
#		@gender = gender
#	end

#	def age
#		@age
#	end

#	def ethnicity
#		@ethnicity
#	end
end

# Test Code - Release 0
# my_santa = Santa.new
# my_santa.speak()
# my_santa.eat_milk_and_cookies("thin mint")

# Test Code - Release 1/2/3 - add diverse initializations
# santas = []
# example_genders = ["male", "female", "agender", "third gender", "genderqueer", "nonbinary", "gender fluid"]
# example_ethnicities = ["afro-latino", "white", "prefer not to say", "inhuman", "Spartoi", "kree", "mutant"]

# example_genders.length.times do |i|
#  santas << Santa.new(example_genders[i], example_ethnicities[i])
# end

# santas.each do |santa|
#	puts santa.age
#	santa.celebrate_birthday
#	santa.gets_mad_at("Vixen")
#	santa.gender = "unknown"
#	puts santa.age
#	puts santa.ethnicity
# end

# Release 4 Driver Code - Build Many, Many Santas

# List of Facebook genders
gender_list = ["Agender", "Androgyne", "Androgynous", "Bigender", "Cis", "Cisgender", "Cis Female", "Cis Male", "Cis Man", "Cis Woman", "Cisgender Female", "Cisgender Male", "Cisgender Man", "Cisgender Woman", "Female to Male", "FTM", "Gender Fluid", "Gender Nonconforming", "Gender Questioning", "Gender Variant", "Genderqueer", "Intersex", "Male to Female", "MTF", "Neither", "Neutrois", "Non-binary", "Other", "Pangender", "Trans", "Trans*", "Trans Female", "Trans* Female", "Trans Male", "Trans* Male", "Trans Man", "Trans* Man", "Trans Person", "Trans* Person", "Trans Woman", "Trans* Woman", "Transfeminine", "Transgender", "Transgender Female", "Transgender Male", "Transgender Man", "Transgender Person", "Transgender Woman", "Transmasculine", "Transsexual", "Transsexual Female", "Transsexual Male", "Transsexual Man", "Transsexual Person", "Transsexual Woman","Two-Spirit"]

# list of ethnicities identified in "American Community Survey" by US Census Bureau
us_ethnicity_list = ["Indian American", "Taiwanese American", "Filipino American", "Australian American", "Israeli American", "European American", "Russian American", "Greek American", "Lebanese American", "Croatian American", "Latvian American", "Lithuanian American", "Austrian American", "Iranian American", "Slovene American", "Swiss American", "Bulgarian American", "Romanian American", "Scandinavian American", "Italian American", "Japanese American", "British American", "Serbian American", "Belgian American", "Scottish American", "Welsh American", "Polish American", "Chinese American", "Slovak American", "Danish American", "Czechslovakian American", "Swedish American", "Norwegian American", "Syrian American", "Czech American", "Hungarian American", "Ukrainian American", "Finnish American", "German American", "English American", "Palestinian American", "French Canadian American", "Portuguese American", "Irish American", "Albanian American", "Canadian American", "Slavic American", "Pakistani American", "Nigerian American", "Scotch-Irish American", "Indonesian American", "Dutch American", "Egyptian American", "French American", "Turkish American", "Armenian American", "Ghanaian American", "Vietnamese American", "Yugoslavian American", "Korean American", "Guyanese American", "British West Indian American", "Brazilian American", "Barbadian American", "Arab American", "Laotian American", "Thai American", "Cambodian American", "West Indian American", "Cajun American", "Trinidadian and Tobagonian American", "Assyrian/Chaldean/Syriac American", "American", "Pennsylvania German American", "Jamaican American", "Cape Verdean American", "Hmong American", "Haitian American", "Jordanian American", "Moroccan American", "Nepali American", "Bangladeshi American", "Afghan American", "Subsaharan African", "Bahamian American", "Ethiopian American", "African", "Arab/Arabic", "Burmese American", "Iraqi American", "Somali American"]

# Create 1000 Santas using a random gender, ethnicity and age.
1000.times do |x|
	x = Santa.new(gender_list.sample, us_ethnicity_list.sample, rand(140))

	# print age, gender and ethnicity
	puts x.age
	puts x.gender
	puts x.ethnicity
end