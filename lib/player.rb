require_relative 'card_dealer'
require_relative 'treasure_kind'

class Player

    @@MAXHIDDENTREASURES = 4

    def initialize(name)
        @name = name
        @dead = false
        @level = 1
    end

    private def bringToLife()
        @dead = false
    end

    private def incrementLevels(levels)
        @level = [10, @level + levels].min

        if @level > 10
        # WIN
        end
    end

    private def decrementLevels(levels)
        @level = [1, @level - levels].max
    end

    private def setPendingBadConsequence(bc)
        @pendingBadConsequence = bc
    end

    private def die()
        @dead = true
        self.visibleTreasures = []
        self.hiddenTreasures = []
    end

    private def discardNecklaceIfVisible()
        for treasure in @visibleTreasures
            if treasure.type == TreasureKind::NECKLACE
                discardVisibleTreasure(treasure)
            end
        end
    end

    private def dieIfNoTreasures()
        if self.visibleTreasures.empty? and self.hiddenTreasures.empty?
            self.die()
        end
    end

    private def canIBuyLevels(levels)
        return @level + levels < 10
    end

    protected def computeGoldCoinsValue(treasures)
        coins_sum = 0.0
        treasures.each { |treasure|
            coins_sum += treasure.goldCoins
        }

        return coins_sum / 1000
    end

    def applyPrize(prize)
    end

    def combat(monster)
    end

    def applyBadConsequence(bc)
    end

    def makeTreasureVisible(treasure)
    end

    def canMakeTreasureVisible(treasure)
        if treasure.type == TreasureKind::ONEHAND
            both_hands_treasures_visible = @visible.select { |visible_treasure| 
                visible_treasure.type == TreasureKind::BOTHHANDS
            }

            if not both_hands_treasures_visible.empty?
                return false
            end
        end 

        similar_treasures_already_visible = @visibleTreasures.select { | visible_treasure |
            visible_treasure.type == treasure.type
        }

        if treasure.type == TreasureKind::ONEHAND
            return similar_treasures_already_visible.length < 2
        else 
            return similar_treasures.already_visible.empty? 
        end
    end

    def discardVisibleTreasure(treasure)
        @visibleTreasures.delete(treasure)
        CardDealer.getInstance().giveTreasureBack(treasure)
    end

    def discardHiddenTreasure(treasure)
        @hiddenTreasures.delete(treasure)
        CardDealer.getInstance().giveTreasureBack(treasure)
    end

    def buyLevels(visibleTreasures, hiddenTreasures)
    end

    def hasNecklaceEquipped()
        for t in @visibleTreasures
            if t.type == TreasureKind::NECKLACE
                return true
            end
        end

        return false
    end

    def getCombatLevel()
        low, high = 0, 0

        @visibleTreasures.each do |t| 
            low += t.minBonus
            high += t.maxBonus
        end

        return self.hasNecklaceEquipped ? high : low
    end

    def validState()
        return @pendingBadConsequence.isEmpty? && @hiddenTreasures < 5
    end

    def initTreasures()
        @visibleTreasures = []
        @hiddenTreasures = []
    end

    def isDead()
        return @dead
    end

    def hasVisibleTreasures()
        return (not @visibleTreasures.empty?)
    end

    def getVisibleTreasures()
    end

    def getHiddenTreasures()
    end

end

