# encoding: UTF-8

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

    setup_monster
  end

  def setup_monster
    @monster = Monster.new(
      @name,
      @combat_level,
      @bad_consequence,
      @prize
    )
  end

  def test_constructor
    assert_equal(@monster.name, @name, 'Name accesor is correct')
    assert(@monster.combat_level > 9000, "It's over 9000!!!")
  end

  def test_to_s
    assert_equal(@monster.to_s,
                 "#{@monster.lvl} [name #{@monster.combat_level}]")
  end

  def sample_bad_consequence
    BadConsequence.new_death('Morirás pronto')
  end

  def sample_prize
    Prize.new([TreasureKind::ARMOR], [1, 2, 3])
  end
end
