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

  def individual_immunity_challenge
    winner = @tribes[0].members.sample
    puts "#{winner} has won the individual challenge and is immune "\
         'from being eliminated.'
    winner
  end

  def clear_tribes
    tribes.clear
  end
  # #
  def merge(new_tribe_name)
    new_tribe = Tribe.new(name: new_tribe_name, members: merge_tribes_members)
    clear_tribes
    tribes << new_tribe
    new_tribe
  end
  # #
  def merge_tribes_members
    tribes.map(&:members).flatten
  end
end
