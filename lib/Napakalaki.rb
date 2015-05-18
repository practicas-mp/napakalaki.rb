require 'singleton'
require_relative 'CombatResult'
require_relative 'CardDealer'
require_relative 'Player'

class Napakalaki

    include Singleton

    def initGame(players)
        CardDealer.getInstance().initCards()
        initPlayers(players)

        @currentPlayerIndex = rand(@players.length)
        @currentPlayer = getCurrentPlayer()
        
        nextTurn()
    end

    private 
    def initPlayers(names)
        @players = names.map { |name| 
            Player.new(name) 
        }
    end

    public 
    def nextPlayer()
        @currentPlayerIndex = (@currentPlayerIndex + 1) % @players.length

        getCurrentPlayer()
    end

    def Napakalaki.getInstance()
        return Napakalaki.instance
    end

    def combat()
        combat_result = @currentPlayer.combat(@currentMonster)
        CardDealer.getInstance().giveMonsterBack(@currentMonster)

        if combat_result == CombatResult::LOSEANDCONVERT
            cultist = CardDealer.instance.nextCultist
            new_player = CultistPlayer.new(@currentPlayer, cultist)
            @players[@currentPlayerIndex] = new_player
            @currentPlayer = new_player
        end

        return combat_result
    end

    def discardVisibleTreasure(treasures)
        treasures.each { |treasure|
            @currentPlayer.discardVisibleTreasure(treasure)
        }
    end

    def discardHiddenTreasure(treasures)
        treasures.each { |treasure|
            @currentPlayer.discardVisibleTreasure(treasure)
        }
    end

    def makeTreasureVisible(treasure)
        @currentPlayer.makeTreasureVisible(treasure)
    end

    def buyLevels(visibleTreasures, hiddenTreasures)
        @currentPlayer.buyLevels(visibleTreasures, hiddenTreasures)
    end

    def getCurrentPlayer()
        @currentPlayer = @players[@currentPlayerIndex]
    end

    def getCurrentMonster()
        @currentMonster
    end

    def canMakeTreasureVisible(treasure)
    end

    def getVisibleTreasures()
    end

    def getHiddenTreasures()
    end

    def nextTurn()
        next_turn_was_allowed = nextTurnAllowed
        if next_turn_was_allowed
            nextPlayer()    
            @currentMonster = CardDealer.getInstance().nextMonster

            if @currentPlayer.isDead
                @currentPlayer.initTreasures()
            end 
        end

        return next_turn_was_allowed
    end

    def nextTurnAllowed()
        @currentPlayer.validState
    end

    def endOfGame(result)
        result == CombatResult::WINDANDWINGAME
    end

end

