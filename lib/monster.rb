class Monster
  def initialize(name, combat_level, prize, bad_consequence)
    @name = name
    @combat_level = combat_level
    @bad_consequence = bad_consequence
    @prize = prize
  end

  def to_s
    "#{@name} [lvl #{@combat_level}]"
  end

  def just_level_loss
    @bad_consequence.just_level_loss
  end

  attr_reader :name, :combat_level, :bad_consequence, :prize
end
