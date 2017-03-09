# Virus Predictor

# I worked on this challenge Kelly Somerville.
# We spent 1 hour 20 minutes on this challenge.

# EXPLANATION OF require_relative
# It allows the data in the state_data.rb file to be accessible in my_soultion.
# It connects the 'state_data' file in local directory. Require relative allows you to load the file relative to the "state_data" file. Require relative starts locally and require starts globally. Require can pull in modules, require relative can only access files.
require_relative 'state_data'

class VirusPredictor

	# Initializes the instance variables
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  # Calls the predicted_deaths and speed_of_spread methods
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private

  # Uses population_density to predict numbers of deaths and puts out the states predicted deaths in outbreak
  def predicted_deaths
    # predicted deaths is solely based on population density
    if @population_density >= 200
      percent_dead = 0.4
    elsif @population_density >= 150
      percent_dead = 0.3
    elsif @population_density >= 100
      percent_dead = 0.2
    elsif @population_density >= 50
      percent_dead = 0.1
    else
      percent_dead = 0.05
    end

    # only do the number of deaths calculate at the end.
    number_of_deaths = (@population * percent_dead).floor

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

  # uses population_density to the speed of spread in a state and puts the output.
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    if @population_density >= 200
      rate_of_spread = 0.5
    elsif @population_density >= 150
      rate_of_spread = 1
    elsif @population_density >= 100
      rate_of_spread = 1.5
    elsif @population_density >= 50
      rate_of_spread = 2
    else
      rate_of_spread = 2.5
    end

    # only do the += calculation at the end
    speed += rate_of_spread

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects

# Release 4 - New Feature
# Run a report for all 50 states
STATE_DATA.each do |state, population_info|
	state_prediction = VirusPredictor.new(state, population_info[:population_density],population_info[:population])
	state_prediction.virus_effects
end


#=======================================================================
# Reflection Section
# What are the differences between the two different hash syntaxes shown in the state_data file?
# The first is the hash rocket, with it you can use a string as the key. The second method sets the key as a symbol.
# What does require_relative do? How is it different from require?
# require_relative will bring in a file and will start by looking in the local directory. require will start at the top of the structure and work its way down. require can also bring in outside modules. 
# What are some ways to iterate through a hash?
# You can iterate through a has via .each, or each_pair.
# When refactoring virus_effects, what stood out to you about the variables, if anything?
# All instances variables are accessible across the class, so no need to pass them - I didn't see this at first and had to be talked through it.
# What concept did you most solidify in this challenge?
# How instance variables work became much more clear. I also learned about he private and public keywords.
#=======================================================================