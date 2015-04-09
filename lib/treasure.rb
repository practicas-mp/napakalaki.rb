class Treasure

    def initialize(name, goldCoins, minBonus, maxBonus, type)
        @name = name
        @goldCoins = goldCoins
        @minBonus = minBonus
        @maxBonus = maxBonus
        @type = type
    end

    attr_reader :name, :goldCoins, :minBonus, :maxBonus, :type

end
