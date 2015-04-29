class Monster
  def initialize(name, combat_level, prize, bad_consequence)
    @name = name
    @combatLevel = combat_level
    @badConsequence = bad_consequence
    @prize = prize
  end

  def to_s
    "#{@name} [lvl #{@combatLevel}]"
  end

  def just_level_loss
    @badConsequence.just_level_loss
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
