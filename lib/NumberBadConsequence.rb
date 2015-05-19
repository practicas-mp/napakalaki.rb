require_relative 'BadConsequence'


class NumberBadConsequence < BadConsequence
    def initialize(text, levels, n_visible_treasures, n_hidden_treasures)
        super(text, levels, n_visible_treasures, n_hidden_treasures, [], [], false)
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

    public_class_method :new
end