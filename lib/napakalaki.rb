require 'singleton'
require_relative './player'
require_relative './combat_result'

class Napakalaki

    include Singleton

    def initGame(players)
        initPlayers(players)
        @currentPlayerIndex = rand(@players.length)
        @currentPlayer = getCurrentPlayer()
        @currentMonster = 0  # should be monsters[0]
    end

    private def initPlayers(names)
        @players = names.map { |name| 
            Player.new(name) 
        }
    end

    private def nextPlayer()
        @currentPlayerIndex = (@currentPlayerIndex + 1) % @players.length

        getCurrentPlayer()
    end

    def Napakalaki.getInstance()
        return Napakalaki.instance
    end

    def combat()
    end

    def discardVisibleTreasure(treasure)
    end

    def discardHiddenTreasure(treasure)
    end

    def makeTreasureVisible(treasure)
    end

    def buyLevels(visibleTreasures, hiddenTreasures)
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
    end

    def nextTurnAllowed()
        @currentPlayer.validState()
    end

    def endOfGame(result)
        result == CombatResult::WINDANDWINGAME
    end

end

