require_relative '../lib/monster-sets/swad_monsters'
require_relative '../lib/treasure_kind'
require 'test/unit'

class TestMonsterSet < Test::Unit::TestCase
  def setup
    @monster_set = swad_monster_set
  end

  def test_combat_level_over
    over_9000 = @monster_set.combat_level_over 9000
    over_4 = @monster_set.combat_level_over 4

    assert_equal(0, over_9000.length)
    assert_equal(11, over_4.length)
  end

  def test_just_level_loss
    just_level_loss_monsters = @monster_set.just_level_loss

    assert_equal(2, just_level_loss_monsters.length)
  end

  def test_level_gain_over
    level_gain_over_1_monsters = @monster_set.level_gain_over 1

    assert_equal(1, level_gain_over_1_monsters.length)
  end

  def test_at_least_one_hand_loss
    one_hand_loss_monsters = @monster_set.losses_treasure TreasureKind::ONEHAND

    assert_equal(3, one_hand_loss_monsters.length)
  end
end
