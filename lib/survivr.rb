require 'colorizr'
require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

def print_header(string)
  puts "=".white * 80
  puts string.center(80).pink
  puts "=".white * 80
end

print_header("Welcome to Survivr!")

#After your tests pass, uncomment this code below
#=========================================================
# Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!

# Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))

# Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
  puts "~~~~~PHASE 1~~~~~".yellow
  8.times do
    @borneo.immunity_challenge.tribal_council
    puts
  end
end

def phase_two
  puts "~~~~~PHASE 2~~~~~".yellow
  3.times do
    @merge_tribe.tribal_council(immune: @borneo.individual_immunity_challenge)
    puts
  end
end

def phase_three
  puts "~~~~~PHASE 3~~~~~".yellow
  7.times do
    @jury.add_member(@merge_tribe.tribal_council(immune: @borneo.individual_immunity_challenge))
    puts
  end
end

# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
puts"Finalists are:".yellow
puts finalists
puts "~~~FINAL VOTES~~~".yellow
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
puts
@jury.announce_winner(vote_results) #Jury announces final winner
