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
      nVisibleTreasures = [ @nVisibleTreasures, visibleTreasures.length].min
      nHiddenTreasures = [ @nHiddenTreasures, hiddenTreasures.length].min

      return self.class.newNumberOfTreasures(@text, @levels, nVisibleTreasures, nHiddenTreasures)
    elsif specificKind?
      # Quedarse solo con los tesoros de los que pueda descartarse el jugador
      visibleTreasuresCopy = Array.new(visibleTreasures)
      vTreasuresToKeepInBC = []
      for treasureKind in @specificVisibleTreasures
        treasureToRemove = nil
        for treasure in visibleTreasures
          if treasure.type == treasureKind
            treasureToRemove = treasure
          end
        end
        if treasureToRemove != nil
          visibleTreasuresCopy.delete(treasureToRemove)
          vTreasuresToKeepInBC << treasureToRemove.type
        end
      end
      

      hiddenTreasuresCopy = Array.new(hiddenTreasures)
      hTreasuresToKeepInBC = []
      for treasureKind in @specificHiddenTreasures
        treasureToRemove = nil
        for treasure in hiddenTreasures
          if treasure.type == treasureKind
            treasureToRemove = treasure
          end
        end
        if treasureToRemove != nil
          hiddenTreasuresCopy.delete(treasureToRemove)  # There is just going to be one
          hTreasuresToKeepInBC << treasureToRemove.type
        end
      end
      
      return self.class.newSpecificTreasures(@text, @levels, vTreasuresToKeepInBC, hTreasuresToKeepInBC)
    end
  end

  def getLevels()
    @levels
  end

  attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures,
              :specificVisibleTreasures, :specificHiddenTreasures, :death

  private_class_method :new

  private
  def numberKind?
    @nVisibleTreasures != 0 || @nHiddenTreasures != 0
  end

  private
  def specificKind?
    !@specificVisibleTreasures.empty? || !@specificHiddenTreasures.empty?
  end
end
