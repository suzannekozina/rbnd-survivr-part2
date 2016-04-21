class Tribe
  attr_reader :name, :members

  def initialize(options)
    @name = options[:name]
    @members = options[:members]

    puts "The #{@name} tribe has been established with the following members:"
    @members.each do |member|
      puts "- #{member}"
    end
    puts
  end

  def tribal_council(options = {})
    loser = @members.select { |member| member != options[:immune] }.sample
    puts "#{@name} has voted off #{loser}."
    @members.delete(loser)
  end

  def to_s
    @name
  end
end
