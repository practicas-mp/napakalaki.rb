class Monster
  def initialize(name, combat_level, bad_consequence, prize)
    @name = name
    @combat_level = combat_level
    @bad_consequence = bad_consequence
    @prize = prize
  end

  attr_reader :name, :combat_level
end
