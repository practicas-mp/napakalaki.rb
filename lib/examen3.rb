# encoding: utf-8

require_relative 'Player'
require_relative 'Treasure'
require_relative 'TreasureKind'
require_relative 'BadConsequence'

class Examen3

    def Examen3.run()
        p = Player.new('P1')
        boots = Treasure.new("Botas de investigación", 600, 3, 4, TreasureKind::SHOE)
        thompson = Treasure.new("Ametralladora Thompson", 600, 4, 8, TreasureKind::BOTHHANDS)
        nail = Treasure.new("Clavo de rail ferroviario", 400, 3, 6, TreasureKind::ONEHAND)
        sushi = Treasure.new("Cuchillo de sushi arcano", 300, 2, 3, TreasureKind::ONEHAND)

        p.setHiddenTreasureList([boots, thompson, nail, sushi])

        puts p

        p.makeTreasureVisible(nail)
        puts p

        p.makeTreasureVisible(thompson)
        puts p

        p.makeTreasureVisible(sushi)
        puts p

        bc = BadConsequence.newSpecificTreasures(
                "Pierdes una mano visible", 0, [TreasureKind::ONEHAND], []
        )

        bc.adjustToFitTreasureLists(p.getVisibleTreasures, p.getHiddenTreasures)
        puts bc

        bc = BadConsequence.newSpecificTreasures(
                "Pierdes una armadura y un calzado oculto", 0, [], [TreasureKind::ARMOR, TreasureKind::SHOE]
        )

        bc.adjustToFitTreasureLists(p.getVisibleTreasures, p.getHiddenTreasures)
        puts bc

        puts p

        CardDealer.getInstance.initCards

        p.buyLevels([thompson, nail, sushi], [])
        puts p
    end

end


if $0 == __FILE__
    Examen3.run 
end
