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
    "#{@text} [ nVisible: #{@nVisibleTreasures} nHidden: #{@nHiddenTreasures} " +
    "vTreasures: #{@specificVisibleTreasures} hTreasures: #{specificHiddenTreasures} ]"
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

  def substractVisibleTreasure(treasure)
    puts "T: #{treasure}, VT: #{@specificVisibleTreasures}"
    if @specificVisibleTreasures.empty?
      @nVisibleTreasures = [@nVisibleTreasures - 1, 0].max
    else
      @specificVisibleTreasures.delete(@specificVisibleTreasures.find_index(treasure.type))
      puts "sVTreasures: #{@specificVisibleTreasures}"
    end
  end

  def substractHiddenTreasure(treasure)
    if @specificHiddenTreasures.empty?
      @nHiddenTreasures = [@nHiddenTreasures - 1, 0].max
    else
      @specificHiddenTreasures.delete_at(@specificHiddenTreasures.find_index(treasure.type))
    end
  end



  def adjustToFitTreasureLists(visibleTreasures, hiddenTreasures)
    if numberKind? # Comprobar si la BadConsequence es de quitar tesoros no especificos
      @nVisibleTreasures = [ @nVisibleTreasures, visibleTreasures.length].min
      @nHiddenTreasures = [ @nHiddenTreasures, hiddenTreasures.length].min
    elsif specificKind?
      # Quedarse solo con los tesoros de los que pueda descartarse el jugador
      @specificVisibleTreasures = @specificVisibleTreasures.select { |treasure_kind|
        visibleTreasures.any? { |treasure|
          treasure.type == treasure_kind
        }
      }

      @specificHiddenTreasures = @specificHiddenTreasures.select { |treasure_kind| 
        hiddenTreasures.any? { |treasure|
          treasure.type == treasure_kind
        }
      }

      puts @specificVisibleTreasures
      puts @specificHiddenTreasures
    end
  end

  def getLevels()
    @levels
  end

  private

  def numberKind?
    @nVisibleTreasures != 0 || @nHiddenTreasures != 0
  end

  def specificKind?
    !@specificVisibleTreasures.empty? || !@specificHiddenTreasures.empty?
  end


  attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures,
              :specificVisibleTreasures, :specificHiddenTreasures, :death

  private_class_method :new
end
