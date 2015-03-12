class BadConsequence
  def initialize(text, levels, visible_treasures, hidden_treasures)
    @text = text
    @levels = levels
    @visible_treasures = visible_treasures
    @hidden_treasures = hidden_treasures
  end

  def number_of_visible_treasures
    @visible_treasures.length
  end

  def number_of_hidden_treasures
    @hidden_treasures.length
  end

  attr_reader :text, :levels, :visible_treasures, :hidden_treasures
end
