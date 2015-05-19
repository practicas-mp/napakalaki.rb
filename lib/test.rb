# encoding: UTF-8

require_relative "TreasureKind"
require_relative "Treasure"
require_relative "SpecificBadConsequence"
require_relative "NumberBadConsequence"

if $0 == __FILE__
    shoe = Treasure.new("Botas de investigación", 600, 3, 4, TreasureKind::SHOE)

    sp = SpecificBadConsequence.new('foo', 0, [TreasureKind::ARMOR, TreasureKind::SHOE], [])
    nb = NumberBadConsequence.new('bar', 0, 2, 1)
    puts sp
    sp = sp.adjustToFitTreasureLists([shoe], [])
    puts sp
end
