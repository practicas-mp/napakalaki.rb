require_relative 'BadConsequence'


class NumberBadConsequence < BadConsequence
    def initialize(text, levels, n_visible_treasures, n_hidden_treasures)
        super(text)
        @levels = levels
        @nVisibleTreasures = n_visible_treasures
        @nHiddenTreasures = n_hidden_treasures
    end

    def to_s
        super + "#{@levels} niveles, #{@nVisibleTreasures} tesoros visibles y " + 
            "#{@nHiddenTreasures} ocultos"
    end

    def adjustToFitTreasureLists(visibleTreasures, hiddenTreasures)
        nVisibleTreasures = [@nVisibleTreasures, visibleTreasures.length].min
        nHiddenTreasures = [@nHiddenTreasures, hiddenTreasures.length].min

        return NumberBadConsequence.new(@text, @levels, nVisibleTreasures, nHiddenTreasures)
    end

    def substractVisibleTreasure(treasure)
        @nVisibleTreasures = [@nVisibleTreasures - 1, 0].max
    end

    def substractHiddenTreasure(treasure)
        @nHiddenTreasures = [@nHiddenTreasures - 1, 0].max
    end

    def kills
        false
    end

    def isEmpty
        @nHiddenTreasures == 0 && @nVisibleTreasures == 0
    end
  
    def getLevels
        @levels
    end

    public_class_method :new
end