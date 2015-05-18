require_relative 'CultistPlayer'

class Cultist
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