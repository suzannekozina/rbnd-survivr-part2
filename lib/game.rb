class Game
  attr_accessor :tribes

  def initialize(*tribes)
    @tribes = tribes
  end

  def add_tribe(tribe)
    @tribes << tribe
  end

  def immunity_challenge
    losing_tribe = @tribes.sample
    puts "#{losing_tribe} has lost the immunity challenge and must vote out a "\
         'member.'
    losing_tribe
  end
  #

  def clear_tribes
    @tribes.clear
  end
  # #
  def merge(new_tribe_name)
    new_tribe = Tribe.new(name: new_tribe_name, members: merged_members)
    clear_tribes
    add_tribe(new_tribe)
    new_tribe
  end
  # #
  def merged_members
    new_members = []
    @tribes.each { |tribe| new_members << tribe.members }
    new_members.flatten!
  end

  def individual_immunity_challenge
    winner = merged_members.sample
    puts "#{winner}".light_blue + " has won the individual challenge and is "\
         'immune from being eliminated.'
    winner
  end
end
