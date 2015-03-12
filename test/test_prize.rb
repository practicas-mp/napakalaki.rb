require_relative '../lib/prize'
require_relative '../lib/treasure_kind'
require 'test/unit'

class TestPrize < Test::Unit::TestCase
  def test_constructor
    treasure_list = [
      TreasureKind::ARMOR,
      TreasureKind::HELMET
    ]

    levels = [1, 2, 3]

    prize = Prize.new(treasure_list, levels)

    assert_equal(prize.treasures, treasure_list)
    assert_equal(levels, levels)
  end
end
