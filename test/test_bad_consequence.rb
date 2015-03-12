require_relative '../lib/bad_consequence'
require_relative '../lib/treasure_kind'
require 'test/unit'

class TestBadConsequence < Test::Unit::TestCase
  def setup
    @text = 'Sample test'
    @levels = [1, 2, 3, 4]
    @visible_treasures = [TreasureKind::ARMOR, TreasureKind::HELMET]
    @hidden_treasures = [TreasureKind::SHOE]

    setup_bad_consequence
  end

  def setup_bad_consequence
    @bad_consequence = BadConsequence.new(
      @text,
      @levels,
      @visible_treasures,
      @hidden_treasures
    )
  end

  def test_accessors
    assert_equal(@bad_consequence.text, @text)
    assert_equal(@bad_consequence.levels, @levels)
    assert_equal(@bad_consequence.visible_treasures, @visible_treasures)
    assert_equal(@bad_consequence.hidden_treasures, @hidden_treasures)
  end

  def test_number_methods
    assert_equal(
      @bad_consequence.number_of_visible_treasures,
      2
    )

    assert_equal(
      @bad_consequence.number_of_hidden_treasures,
      1
    )
  end
end
