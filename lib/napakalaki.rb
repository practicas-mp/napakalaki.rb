require 'singleton'

require 'napakalaki/version'

module Napakalaki

class Napakalaki

    include Singleton

    private def initPlayers(names)
        @players = []
    end

    private def nextPlayer()
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

    def initGame(players)
        self.initPlayers(players)
        @currentMonster = 0  # should be monsters[0]
        @currentPlayer = @players[0]
    end

    def getCurrentPlayer()
    end

    def getCurrentMonster()
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
    end

    def endOfGame(result)
    end

end

end
