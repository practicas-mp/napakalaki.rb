# This class represents a Prize in the game
class Prize
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
