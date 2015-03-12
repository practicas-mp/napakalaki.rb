require_relative '../lib/monster.rb'
require_relative '../lib/bad_consequence'
require_relative '../lib/prize'
require_relative '../lib/treasure_kind'
require 'test/unit'

class TestMonster < Test::Unit::TestCase
  def setup
    @name = 'Petete'
    @combat_level = 9001
    @bad_consequence = sample_bad_consequence
    @prize = sample_prize
  end

  def test_constructor
    monster = Monster.new(
      @name,
      @combat_level,
      @bad_consequence,
      @prize
    )

    assert_equal(monster.name, @name, 'Name accesor is correct')
    assert(monster.combat_level > 9000, "It's over 9000!!!")
  end

  def sample_bad_consequence
    BadConsequence.new(
      'Moriras pronto',
      [1, 2, 3],
      [],
      []
    )
  end

  def sample_prize
    Prize.new(
      [TreasureKind::ARMOR],
      [1, 2, 3]
    )
  end
end
