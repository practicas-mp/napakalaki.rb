class Monster
  def initialize(name, combat_level, bad_consequence, prize)
    @name = name
    @combat_level = combat_level
    @bad_consequence = bad_consequence
    @prize = prize
  end

  def to_s
    "#{@name} [lvl #{@combat_level}]"
  end

  attr_reader :name, :combat_level, :bad_consequence, :prize
end
