require_relative '../lib/bad_consequence'
require_relative '../lib/treasure_kind'
require 'test/unit'

class TestBadConsequence < Test::Unit::TestCase
  def setup
    @text = 'Sample test'
    @levels = 2
    @n_visible_treasures = 1
    @n_hidden_treasures = 2
    @visible_treasures = [TreasureKind::ARMOR, TreasureKind::HELMET]
    @hidden_treasures = [TreasureKind::SHOE]

    setup_bad_consequence
  end

  def setup_bad_consequence
    @bad_consequence = BadConsequence.newSpecificTreasures(
      @text,
      @levels,
      @visible_treasures,
      @hidden_treasures
    )

    @n_bad_consequence = BadConsequence.newNumberOfTreasures(
      @text,
      @levels,
      @n_visible_treasures,
      @n_hidden_treasures
    )

    @death_bad_consequence = BadConsequence.newDeath(@text)
  end

  def test_accessors
    assert_equal(@bad_consequence.text, @text)
    assert_equal(@bad_consequence.levels, @levels)
    assert_equal(@bad_consequence.specific_visible_treasures,
                 @visible_treasures)
    assert_equal(@bad_consequence.specific_hidden_treasures, @hidden_treasures)
    assert_equal(@n_bad_consequence.n_visible_treasures, @n_visible_treasures)
    assert_equal(@n_bad_consequence.n_hidden_treasures, @n_hidden_treasures)
  end

  def test_specific_constructor
    assert_equal(
      @bad_consequence.specific_visible_treasures,
      @visible_treasures
    )

    assert_equal(
      @bad_consequence.specific_hidden_treasures,
      @hidden_treasures
    )
  end

  def test_number_constructor
    assert_equal(@n_bad_consequence.n_visible_treasures, @n_visible_treasures)
    assert_equal(@n_bad_consequence.n_hidden_treasures, @n_hidden_treasures)
  end

  def test_death_constructor
    assert @death_bad_consequence.death
  end

  def test_to_s
    assert_equal(@bad_consequence.to_s, @text)
  end
end
