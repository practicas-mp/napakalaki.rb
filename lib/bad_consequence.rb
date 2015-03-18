

class BadConsequence
  def initialize(text, levels, n_visible_treasures,
      n_hidden_treasures, specific_visible_treasures,
      specific_hidden_treasures, death)
    @text = text
    @levels = levels
    @n_visible_treasures = n_visible_treasures
    @n_hidden_treasures = n_hidden_treasures
    @specific_visible_treasures = specific_visible_treasures
    @specific_hidden_treasures = specific_hidden_treasures
    @death = death
  end

  def self.new_number_of_treasures(text, levels, n_visible_treasures,
                                n_hidden_treasures)
    new(text, levels, n_visible_treasures, n_hidden_treasures,
        [], [], false)
  end

  def self.new_specific_treasures(text, levels, specific_visible_treasures,
                              specific_hidden_treasures)
    new(text, levels, 0, 0, specific_visible_treasures,
        specific_hidden_treasures, false)
  end

  def self.new_death(text)
    new(text, 0, 0, 0, [], [], true)
  end

  def to_s
    "#{@text}"
  end

  attr_reader :text, :levels, :n_visible_treasures, :n_hidden_treasures,
              :specific_visible_treasures, :specific_hidden_treasures, :death

  private_class_method :new
end
