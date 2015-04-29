require 'singleton'


class Dice

    include Singleton

    def Dice.getInstance()
        return Dice.instance
    end

    def nextNumber()
        return 1 + rand(6)
    end
end