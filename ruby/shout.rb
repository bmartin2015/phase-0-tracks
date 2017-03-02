module Shout
	# Release 1 code
#	def self.yell_angrily(words)
#		words + "!!!" + " :("
#	end
#
#	def self.yell_happily(words)
#		words.upcase + "!!!" + " :D"
#	end

	# Release 3 code
	def yell_angrily(words)
		words + "!!!" + " :("
	end

	def yell_happily(words)
		words.upcase + "!!!" + " :D"
	end
end

# Classes - Release 2
class Prairie_dog
	include Shout
end

class Customer
	include Shout
end

# Driver code - Release 2
prairie_dog = Prairie_dog.new
customer = Customer.new

puts prairie_dog.yell_happily("bark")
puts customer.yell_angrily("I want to speak to your manager")

# Driver Code - Release 1
# puts Shout.yell_angrily("stop")
# puts Shout.yell_happily("yay")