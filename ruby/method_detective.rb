# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

"iNvEsTiGaTiOn".swapcase
# => “InVeStIgAtIoN”

"zom".insert(1,'o')
# => “zoom”

"enhance".center(15)
# => "    enhance    "

"Stop! You’re under arrest!".upcase
# => "STOP! YOU’RE UNDER ARREST!"

"the usual".concat(" suspects")
#=> "the usual suspects"

" suspects".prepend("the usual")
# => "the usual suspects"

"The case of the disappearing last letter".chop
# => "The case of the disappearing last lette"

"The mystery of the missing first letter".slice(1..-1)
# => "he mystery of the missing first letter"

"Elementary,    my   dear        Watson!".squeeze(" ")
# => "Elementary, my dear Watson!"

"z".ord
# => 122 
# (What is the significance of the number 122 in relation to the character z?)
# 122 is the ASCII code for z

#You can also return an array using bytes
"z".bytes
# => [122]

"How many times does the letter 'a' appear in this string?".count("a")
# => 4


# I am calling all of them below to see if they are the same as the expected return
p "iNvEsTiGaTiOn".swapcase == "InVeStIgAtIoN"

p "zom".insert(1,'o') == "zoom"

p "enhance".center(15) == "    enhance    "

p "Stop! You’re under arrest!".upcase == "STOP! YOU’RE UNDER ARREST!"

p "the usual".concat(" suspects") == "the usual suspects"

p " suspects".prepend("the usual") == "the usual suspects"

p "The case of the disappearing last letter".chop == "The case of the disappearing last lette"

p "The mystery of the missing first letter".slice(1..-1) == "he mystery of the missing first letter"

p "Elementary,    my   dear        Watson!".squeeze(" ") == "Elementary, my dear Watson!"

p "z".ord == 122 

p "z".bytes == [122]

p "How many times does the letter 'a' appear in this string?".count("a")  == 4