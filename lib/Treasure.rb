class Treasure
    def initialize(name, goldCoins, minBonus, maxBonus, type)
        @name = name
        @goldCoins = goldCoins
        @minBonus = minBonus
        @maxBonus = maxBonus
        @type = type
    end

    def to_s
    	"#{@name} - Coins: #{@goldCoins} - Min/Max bonus: #{@minBonus}/#{@maxBonus} - Type: #{@type}"
    end

    def getBasicValue
        @minBonus
    end

    def getSpecialValue
        @maxBonus
    end

    attr_reader :name, :goldCoins, :minBonus, :maxBonus, :type

end
