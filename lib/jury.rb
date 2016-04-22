class Jury
  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member(member)
    puts "#{member}".light_blue + " has been added to the jury."
    @members << member
  end

  def cast_votes(finalists)
    votes = {}
    finalists.each do |finalist|
      votes[finalist] = 0
    end

    count_votes(finalists, votes)
    end

    def report_votes(final_votes = cast_votes(finalists))
      final_votes.each do |k, v|
        puts "#{k} received #{v} vote"
      end
    end

    def announce_winner(final_votes = cast_votes(finalists))
      max_votes = final_votes.values.max
      winner = final_votes
                .select { |_k, v| v == max_votes }
                .keys
                .first

      print_header("Survivr Final Results")
      puts "The winner of this game of Survivor is: ".white + "#{winner.name.upcase.pink}"
      puts "Congratulations ".white + "#{winner.name.upcase.pink}" + "!".white
      winner
    end

    private

    def count_votes(finalists, votes)
      members.each do |member|
        vote = finalists.sample
        votes[vote] += 1
        puts "#{member} voted for #{vote}"
    end

    votes
  end
end
