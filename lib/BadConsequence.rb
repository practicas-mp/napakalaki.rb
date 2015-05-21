class BadConsequence
  def initialize(text)
    @text = text
  end

  def to_s
    'Este mal rollo tiene como consecuencia: '
  end

  attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures,
              :specificVisibleTreasures, :specificHiddenTreasures, :death

  private_class_method :new
end
