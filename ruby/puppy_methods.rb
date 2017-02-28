class Puppy
  def fetch(toy)
  	@toy = toy
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(number)
  	number.times { puts "Woof!" }
  end

  def rollover()
  	puts "rolls over"
  end

  def dog_years(age)
  	return age.to_i * 7
  end

  def treat(food)
  	puts "eats the #{food}"
  end

  def initialize()
  	puts "Initializing new puppy instance."
  end
end

# Release 2
class Cat
	def initialize()
		puts "Initializing new cat instance."
	end

	def cats_speech(meow)
		puts "The cat makes a #{meow} sound."
	end

	def move(dir)
		puts "The cat #{dir} off the couch."
	end
end

cat_array = []

50.times do |x|
	x = Cat.new
	cat_array << x
end

cat_array.each do |cat_name|
	cat_name.cats_speech("meow")
	cat_name.move("jumps")
end

# Driver code
spot = Puppy.new()

spot.fetch("ball")
spot.speak(3)
spot.rollover()
puts spot.dog_years(7)
spot.treat("bone")