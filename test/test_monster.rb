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
      @prize,
      @bad_consequence
    )
  end

  def test_constructor
    assert_equal(@monster.name, @name, 'Name accesor is correct')
    assert(@monster.combat_level > 9000, "It's over 9000!!!")
    assert_equal(@monster.bad_consequence.text, "Morirás pronto")
    assert_equal(@monster.prize.levels, 3)
  end

  def test_to_s
    assert_equal(@monster.to_s,
                 "#{@monster.name} [lvl #{@monster.combat_level}]")
  end

  def sample_bad_consequence
    BadConsequence.newDeath('Morirás pronto')
  end

  def sample_prize
    Prize.new([TreasureKind::ARMOR], 3)
  end
end
