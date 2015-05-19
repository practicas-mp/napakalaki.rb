class BadConsequence
  def initialize(text, levels, n_visible_treasures,
      n_hidden_treasures, specific_visible_treasures,
      specific_hidden_treasures, death)
    @text = text
    @levels = levels
    @nVisibleTreasures = n_visible_treasures
    @nHiddenTreasures = n_hidden_treasures
    @specificVisibleTreasures = specific_visible_treasures
    @specificHiddenTreasures = specific_hidden_treasures
    @death = death
  end

  def to_s
    # "#{@text} [ nVisible: #{@nVisibleTreasures} nHidden: #{@nHiddenTreasures} " +
    # "vTreasures: #{@specificVisibleTreasures} hTreasures: #{specificHiddenTreasures} ]"
    'Este mal rollo tiene como consecuencia: '
  end

  def isEmpty()
    return @nVisibleTreasures == 0 &&
            @nHiddenTreasures == 0 &&
            @specificVisibleTreasures.empty? &&
            @specificHiddenTreasures.empty?
  end

  def kills()
    return @death
  end
  
  def getLevels()
    @levels
  end

  attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures,
              :specificVisibleTreasures, :specificHiddenTreasures, :death

  private_class_method :new
end
