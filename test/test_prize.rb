require_relative '../lib/prize'
require_relative '../lib/treasure_kind'
require 'test/unit'

class TestPrize < Test::Unit::TestCase
  def setup
    @treasure_list = [
      TreasureKind::ARMOR,
      TreasureKind::HELMET
    ]

    @levels = [1, 2, 3]

    @prize = Prize.new(@treasure_list, @levels)
  end

  def test_constructor
    assert_equal(@prize.treasures, @treasure_list)
    assert_equal(@prize.levels, @levels)
  end

  def test_to_s
    assert_equal(
      @prize.to_s,
      "Treasures: #{@prize.treasures}\nLevels: #{@prize.levels}"
    )
  end
end
