class MonsterSet
  def initialize(monsters)
    @monsters = monsters
  end

  def <<(monster)
    @monsters << monster
  end

  def length
    @monsters.length
  end

  def filter
    new_monsters = @monsters.select do |monster|
      yield(monster)
    end

    MonsterSet.new(new_monsters)
  end

  def combat_level_over(combat_level)
    filter do |monster|
      monster.combat_level > combat_level
    end
  end

  def level_gain_over(level)
    filter do |monster|
      monster.prize.levels > level
    end
  end

  def just_level_loss
    filter(&:just_level_loss)
  end

  def losses_treasure(treasure_kind)
    filter do |monster|
      bad_consequence = monster.bad_consequence

      bad_consequence.specific_visible_treasures.include?(treasure_kind) ||
        bad_consequence.specific_hidden_treasures.include?(treasure_kind)
    end
  end
end
