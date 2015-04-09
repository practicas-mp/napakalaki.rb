class Player

    @@MAXHIDDENTREASURES = 4

    def initialize(name)
        @name = name
        @dead = false
        @level = 1
    end

    # private def bringToLife()
    #     @dead = false
    # end

    # private def incrementLevels(levels)
    #     @levels = [10, @levels + levels].min

    #     if @levels == 10
    #         # WIN
    #     end
    # end

    # private def decrementLevels(levels)
    #     @levels = [1, @levels - levels].max
    # end

    # private def setPendingBadConsequence(bc)
    #     @pendingBadConsequence = bc
    # end

    # private def die()
    #     @dead = true
    #     self.visibleTreasures = []
    #     self.hiddenTreasures = []
    # end

    # private def discardNecklaceIfVisible()
    # end

    # private def dieIfNoTreasures()
    #     if self.visibleTreasures.empty? and self.hiddenTreasures.empty?
    #         self.die()
    #     end
    # end

    # private def canIBuyLevels(levels)
    #     return @levels + levels < 10
    # end

    # protected def computeGoldCoinsValue(treasure)
    # end

    def applyPrize(prize)
    end

    def combat(monster)
    end

    def applyBadConsequence(bc)
    end

    def makeTreasureVisible(treasure)
    end

    def canMakeTreasureVisible(treasure)
    end

    def discardVisibleTreasure(treasure)
    end

    def discardHiddenTreasure(treasure)
    end

    def buyLevels(visibleTreasures, hiddenTreasures)
    end

    def hasNecklaceEquipped?()
        for t in @visibleTreasures
            if t.type == TreasureKind::NECKLACE
                return true
            end
        end

        return false
    end

    def getCombatLevel()
        low, high = 0, 0

        # @visibleTreasures.each do |t| 
        #     low += t.minBonus
        #     high += t.maxBonus
        # end

        return self.hasNecklaceEquipped?() ? high : low
    end

    def validState?()
        return @pendingBadConsequence.isEmpty? && @hiddenTreasures < 5
    end

    def initTreasures()
        @visibleTreasures = []
        @hiddenTreasures = []
    end

    def isDead?()
        return @dead
    end

    def hasVisibleTreasures?()
        return (not @visibleTreasures.empty?)
    end

    # EXAMEN

    def setVisibleTreasureList(treasures)
        @visibleTreasures = treasures
    end

    def setHiddenTreasureList(treasures)
        @hiddenTreasures = treasures
    end

    # FIN EXAMEN

    def getVisibleTreasures()
    end

    def getHiddenTreasures()
    end

end

