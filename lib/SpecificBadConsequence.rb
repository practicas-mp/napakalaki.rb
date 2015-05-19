require_relative 'BadConsequence'


class SpecificBadConsequence < BadConsequence
    def initialize(text, levels, visibleTreasures, hiddenTreasures)
        super(text, levels, 0, 0, visibleTreasures, hiddenTreasures, false)
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
        @specificVisibleTreasures.delete(@specificVisibleTreasures.find_index(treasure.type))
    end

    def substractHiddenreasure(treasure)
        @specificHiddenTreasures.delete(@specificHiddenTreasures.find_index(treasure.type))
    end

    public_class_method :new
end