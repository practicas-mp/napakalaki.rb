require_relative 'BadConsequence'


class SpecificBadConsequence < BadConsequence
    def initialize(text, levels, specific_visible_treasures, specific_hidden_treasures)
        super(text)
        @levels = levels    
        @specificVisibleTreasures = specific_visible_treasures
        @specificHiddenTreasures = specific_hidden_treasures
    end

    def to_s
        super + "#{@levels} niveles, #{@specificVisibleTreasures} (visibles) y " + 
            "#{@specificHiddenTreasures} (ocultos)"
    end

    def adjustToFitTreasureLists(visibleTreasures, hiddenTreasures)
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
      
      return SpecificBadConsequence.new(@text, @levels, vTreasuresToKeepInBC, hTreasuresToKeepInBC)
    end

    def substractVisibleTreasure(treasure)
        @specificVisibleTreasures.delete_at(@specificVisibleTreasures.find_index(treasure.type))
    end

    def substractHiddenTreasure(treasure)
        puts "#{@specificHiddenTreasures}"
        @specificHiddenTreasures.delete_at(@specificHiddenTreasures.find_index(treasure.type))
    end

    def kills
        false
    end

    def isEmpty
      @specificHiddenTreasures.empty? && @specificVisibleTreasures.empty?
    end

    def getLevels
        @levels
    end

    public_class_method :new
end