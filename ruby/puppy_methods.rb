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

# Driver code
spot = Puppy.new()

spot.fetch("ball")
spot.speak(3)
spot.rollover()
puts spot.dog_years(7)
spot.treat("bone")

