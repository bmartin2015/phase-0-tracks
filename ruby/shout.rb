module Shout
  # we'll put some methods here soon, but this code is fine for now!
	def self.yell_angrily(words)
		words + "!!!" + " :("
	end

	def self.yell_happily(words)
		words.upcase + "!!!" + " :D"
	end
end

# Driver Code
puts Shout.yell_angrily("stop")
puts Shout.yell_happily("yay")