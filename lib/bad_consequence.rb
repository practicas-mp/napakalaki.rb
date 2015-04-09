

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

  def self.newNumberOfTreasures(text, levels, n_visible_treasures,
                                n_hidden_treasures)
    new(text, levels, n_visible_treasures, n_hidden_treasures,
        [], [], false)
  end

  def self.newSpecificTreasures(text, levels, specific_visible_treasures,
                              specific_hidden_treasures)
    new(text, levels, 0, 0, specific_visible_treasures,
        specific_hidden_treasures, false)
  end

  def self.newDeath(text)
    new(text, 0, 0, 0, [], [], true)
  end

  def to_s
    "#{@text}"
  end

  def isEmpty?()
    return @levels == 0 &&
            @nVisibleTreasures == 0 &&
            @nHiddenTreasures == 0 &&
            @death == false &&
            @specificVisibleTreasures.emtpy? &&
            @specificHiddenTreasures.emtpy?
  end

  def kills?()
    return @death
  end

  def substractVisibleTreasure(treasure)
  end

  def substractHiddenTreasure(treasure)
  end

  def adjustToFitTreasureLists(visibleTreasures, hiddenTreasures)
  end

  attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures,
              :specificVisibleTreasures, :specificHiddenTreasures, :death

  private_class_method :new
end
