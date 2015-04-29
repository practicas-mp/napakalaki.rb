require_relative 'card_dealer'
require_relative 'treasure_kind'
require_relative 'combat_result'
require_relative 'dice'

class Player

    @@MAXHIDDENTREASURES = 4

    def initialize(name)
        @name = name
        @dead = true
        @level = 1

        @visibleTreasures = []
        @hiddenTreasures = []
    end

    def getName
        @name
    end

    private 
    def bringToLife()
        @dead = false
    end

    def incrementLevels(levels)
        @level = [10, @level + levels].min

        if @level > 10
        # WIN
        end
    end

    def decrementLevels(levels)
        @level = [1, @level - levels].max
    end

    def setPendingBadConsequence(bc)
        @pendingBadConsequence = bc
    end

    def die()
        @visibleTreasures.each { |treasure|
            CardDealer.instance.giveTreasureBack(treasure)
        }

        @hiddenTreasures.each { |treasure|
            CardDealer.instance.giveTreasureBack(treasure)
        }

        @dead = true
        @level = 1
        @visibleTreasures = []
        @hiddenTreasures = []
    end

    def discardNecklaceIfVisible()
        for treasure in @visibleTreasures
            if treasure.type == TreasureKind::NECKLACE
                discardVisibleTreasure(treasure)
            end
        end
    end

    def dieIfNoTreasures()
        if @visibleTreasures.empty? and @hiddenTreasures.empty?
            @dead = true
        end
    end

    def canIBuyLevels(levels)
        return @level + levels < 10
    end

    protected
    def computeGoldCoinsValue(treasures)
        coins_sum = 0.0
        treasures.each { |treasure|
            coins_sum += treasure.goldCoins
        }

        return coins_sum / 1000
    end

    public 
    def applyPrize(prize)
        levels = prize.getLevels()
        incrementLevels(levels)
        number_of_treasures = prize.getTreasures()

        number_of_treasures.times { |_|
            new_treasure = CardDealer.instance.nextTreasure()
            @hiddenTreasures << new_treasure
        }
    end

    def combat(monster)
        my_level = getCombatLevel()
        monster_level = monster.getLevel()


        if my_level > monster_level
            prize = monster.getPrize()
            applyPrize(prize)

            if @level < 10
                result = CombatResult::WIN
            else
                result = CombatResult::WINANDWINGAME
            end

        else
            escape = Dice.instance.nextNumber

            if escape < 5
                bad = monster.getBadConsequence()
                

                if bad.kills()
                    die
                    result = CombatResult::LOSEANDDIE
                else
                    applyBadConsequence(bad)
                    puts bad
                    result = CombatResult::LOSE
                end


            else
                result = CombatResult::LOSEANDESCAPE
            end
        end

        discardNecklaceIfVisible
        dieIfNoTreasures

        return result
    end

    def applyBadConsequence(bc)
        levels = bc.getLevels()
        decrementLevels(levels)

        bc.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)

        setPendingBadConsequence(bc)
    end

    def makeTreasureVisible(treasure)
        if canMakeTreasureVisible(treasure)
            @hiddenTreasures.delete(treasure)
            @visibleTreasures << treasure
            return true
        else
            return false
        end
    end

    def canMakeTreasureVisible(treasure)
        if treasure.type == TreasureKind::ONEHAND
            both_hands_treasures_visible = @visibleTreasures.select { |visible_treasure| 
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
            return similar_treasures_already_visible.empty? 
        end
    end

    def discardVisibleTreasure(treasure)
        @visibleTreasures.delete(treasure)
        
        if @pendingBadConsequence != nil && @pendingBadConsequence.isEmpty == false
            @pendingBadConsequence.substractVisibleTreasure(treasure)
        end

        CardDealer.getInstance().giveTreasureBack(treasure)
    end

    def discardHiddenTreasure(treasure)
        @hiddenTreasures.delete(treasure)

        if @pendingBadConsequence != nil && @pendingBadConsequence.isEmpty == false
            @pendingBadConsequence.substractHiddenTreasure(treasure)
        end

        CardDealer.getInstance().giveTreasureBack(treasure)
    end

    def buyLevels(visibleTreasures, hiddenTreasures)
        levels = computeGoldCoinsValue(visibleTreasures)
        levels += computeGoldCoinsValue(hiddenTreasures)

        if canIBuyLevels(levels)
            incrementLevels(levels.floor)

            visibleTreasures.each { |treasure| 
                discardVisibleTreasure(treasure)
            }

            hiddenTreasures.each { |treasure| 
                discardHiddenTreasure(treasure)
            }

            return true
        end

        return false
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
        low, high = @level, @level

        @visibleTreasures.each do |t| 
            low += t.minBonus
            high += t.maxBonus
        end

        return self.hasNecklaceEquipped ? high : low
    end

    def validState()
        # No debería mostrarse aqui, pero no podemos modificar el front-end...
        puts @pendingBadConsequence if @pendingBadConsequence != nil && !@pendingBadConsequence.isEmpty
        return @pendingBadConsequence == nil || 
            @pendingBadConsequence.isEmpty && 
            @hiddenTreasures.length < 5
    end

    def initTreasures()
        bringToLife()
        @hiddenTreasures = []
        @visibleTreasures = []
        dice_result = Dice.instance.nextNumber()

        if dice_result == 1
            @hiddenTreasures << CardDealer.instance.nextTreasure()
        elsif 1 < dice_result && dice_result < 6
            2.times { |_|
                @hiddenTreasures << CardDealer.instance.nextTreasure()
            }
        elsif dice_result == 6
            3.times { |_|
                @hiddenTreasures << CardDealer.instance.nextTreasure()
            }
        end

        puts @hiddenTreasures

    end

    def isDead()
        return @dead
    end

    def hasVisibleTreasures()
        return (not @visibleTreasures.empty?)
    end

    def getVisibleTreasures()
        @visibleTreasures
    end

    def getHiddenTreasures()
        @hiddenTreasures
    end

    def to_s
        "#{@name}, nivel #{@level} "
    end



end

