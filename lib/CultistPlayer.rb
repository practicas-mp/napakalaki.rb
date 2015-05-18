require_relative 'Player'


class CultistPlayer < Player
    @@total_cultist_players = 0

    def initialize(player, cultist)
        new_player = player.clone
        @name = new_player.getName
        @dead = new_player.isDead
        @level = new_player.level
        @visibleTreasures = new_player.getVisibleTreasures
        @hiddenTreasures = new_player.getHiddenTreasures

        @@total_cultist_players += 1
        @myCultistCard = cultist
    end

    def CultistPlayer.getTotalCultistPlayers
        @@total_cultist_players
    end

    def shouldConvert
        false
    end

    def getCombatLevel
        super + @myCultistCard.getSpecialValue
    end

    def getOponentLevel(monster)
        monster.getSpecialValue
    end

    def computeGoldCoinsValue(treasures)
        super * 2
    end

    def to_s
        super + '[cultist]'
    end
end