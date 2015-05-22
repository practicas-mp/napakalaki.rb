require_relative 'Card'

class Prize
  include Card
  def initialize(treasures, levels)
    @treasures = treasures
    @levels = levels
  end

  def to_s
    "Treasures: #{@treasures}\nLevels: #{@levels}"
  end

  def getLevels
  	@levels
  end

  def getTreasures
    @treasures
  end

  attr_reader :treasures, :levels
end
