require_relative 'Card'

class Monster
  include Card

  def initialize(name, combat_level, prize, bad_consequence, levelChangeAgainstCultistPlayer)
    @name = name
    @combatLevel = combat_level
    @badConsequence = bad_consequence
    @prize = prize
    @levelChangeAgainstCultistPlayer = levelChangeAgainstCultistPlayer
  end

  def to_s
    "#{@name} [lvl #{@combatLevel}]\n #{@badConsequence.text}"
  end

  def getBasicValue
    self.getLevel
  end

  def getSpecialValue
    self.getLevel + @levelChangeAgainstCultistPlayer
  end

  def getLevel
    @combatLevel
  end

  def getBadConsequence
    @badConsequence
  end

  def getPrize
    @prize
  end 
end