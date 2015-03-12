# This class represents a Prize in the game
class Prize
  def initialize(treasures, levels)
    @treasures = treasures
    @levels = levels
  end

  attr_reader :treasures, :levels
end
