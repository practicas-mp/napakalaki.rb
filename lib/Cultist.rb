require_relative 'CultistPlayer'
require_relative 'Card'


class Cultist
    include Card
    def initialize(name, gainedLevels)
        @name = name
        @gainedLevels = gainedLevels
    end

    def getBasicValue
        @gainedLevels
    end

    def getSpecialValue
        @gainedLevels * CultistPlayer.getTotalCultistPlayers
    end
end