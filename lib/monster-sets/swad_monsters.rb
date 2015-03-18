# encoding: UTF-8

require_relative '../prize'
require_relative '../bad_consequence'
require_relative '../monster'
require_relative '../treasure_kind'
require_relative './monster_set'

@@swad_monsters = monsters = []

prize = Prize.new(2, 1)
bad_consequence = BadConsequence.new_specific_treasures(
  'Pierdes tu armadura visible y otra oculta',
  0,
  [TreasureKind::ARMOR],
  [TreasureKind::ARMOR]
)
monsters << Monster.new('3 Byakhees de bonanza', 8, prize, bad_consequence)

prize = Prize.new(1, 1)
bad_consequence = BadConsequence.new_specific_treasures(
  'Embobados con el lindo primigenio, te descartas de tu casco visible',
  0,
  [TreasureKind::HELMET],
  []
)
monsters << Monster.new('Chibithulhu', 2, prize, bad_consequence)

prize = Prize.new(1, 1)
bad_consequence = BadConsequence.new_specific_treasures(
  'El primordial bostezo contagioso. Pierdes el calzado visible',
  0,
  [TreasureKind::SHOE],
  []
)
monsters << Monster.new('El sopor de Dunwich', 2, prize, bad_consequence)

prize = Prize.new(4, 1)
bad_consequence = BadConsequence.new_specific_treasures(
  'Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. ' \
  ' Descarta una mano visible y otra oculta',
  0,
  [TreasureKind::ONEHAND],
  [TreasureKind::ONEHAND]
)
monsters << Monster.new(
  'Ángeles de la noche ibicenca',
  14,
  prize,
  bad_consequence
)

prize = Prize.new(3, 1)
bad_consequence = BadConsequence.new_number_of_treasures(
  'Pierdes todos tus tesoros visibles',
  0,
  5,
  0
)
monsters << Monster.new('El gorrón en el umbral', 10, prize, bad_consequence)

prize = Prize.new(2, 1)
bad_consequence = BadConsequence.new_specific_treasures(
  'Pierdes la armadura visible',
  0,
  [TreasureKind::ARMOR],
  []
)
monsters << Monster.new('H.P. Munchcraft', 6, prize, bad_consequence)

prize = Prize.new(1, 1)
bad_consequence = BadConsequence.new_specific_treasures(
  'Sientes bichos bajo la ropa, descarta tu armadura visible',
  0,
  [TreasureKind::ARMOR],
  []
)
monsters << Monster.new('Bichgooth', 2, prize, bad_consequence)

prize = Prize.new(4, 2)
bad_consequence = BadConsequence.new_number_of_treasures(
  'Pierdes 5 niveles y 3 tesoros visibles',
  5,
  3,
  0
)
monsters << Monster.new('El rey de rosa', 13, prize, bad_consequence)

prize = Prize.new(1, 1)
bad_consequence = BadConsequence.new_number_of_treasures(
  'Toses los pulmones y pierdes 2 niveles',
  2,
  0,
  0
)
monsters << Monster.new(
  'La que redacta en las tinieblas',
  2,
  prize,
  bad_consequence
)

prize = Prize.new(2, 1)
bad_consequence = BadConsequence.new_death(
  'Estos monstruos resultan bastante superficiales ' \
  'y te aburren mortalmente. Estás muerto'
)
monsters << Monster.new('Los hondos', 8, prize, bad_consequence)

prize = Prize.new(2, 1)
bad_consequence = BadConsequence.new_number_of_treasures(
  'Pierdes dos niveles y dos tesoros ocultos',
  2,
  0,
  2
)
monsters << Monster.new('Semillas Cthulhu', 4, prize, bad_consequence)

prize = Prize.new(2, 1)
bad_consequence = BadConsequence.new_specific_treasures(
  'Te intentas escaquear. Pierdes una mano visible',
  0,
  [TreasureKind::ONEHAND],
  []
)
monsters << Monster.new('Dameargo', 1, prize, bad_consequence)

prize = Prize.new(1, 1)
bad_consequence = BadConsequence.new_number_of_treasures(
  'Da mucho asquito. Pierdes 3 niveles',
  3,
  0,
  0
)
monsters << Monster.new('Pollipólipo volante', 3, prize, bad_consequence)

prize = Prize.new(3, 1)
bad_consequence = BadConsequence.new_death(
  'No le hace gracia que pronucien mal su nombre, estás muerto'
)
monsters << Monster.new('Yskhtihyssg-Goth', 12, prize, bad_consequence)

prize = Prize.new(4, 1)
bad_consequence = BadConsequence.new_death('La familia te atrapa. Estás muerto')
monsters << Monster.new('Familia feliz', 1, prize, bad_consequence)

prize = Prize.new(2, 1)
bad_consequence = BadConsequence.new_specific_treasures(
  'La quinta directiva primaria te obliga a perder dos niveles ' \
  'y un tesoro de dos manos visible',
  2,
  [TreasureKind::BOTHHANDS],
  []
)
monsters << Monster.new('Roboggoth', 8, prize, bad_consequence)

prize = Prize.new(1, 1)
bad_consequence = BadConsequence.new_specific_treasures(
  'Te asusta en la noche. Pierdes un casco visible',
  0,
  [TreasureKind::HELMET],
  []
)
monsters << Monster.new('El espia', 5, prize, bad_consequence)

prize = Prize.new(1, 1)
bad_consequence = BadConsequence.new_number_of_treasures(
  'Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles',
  2,
  5,
  0
)
monsters << Monster.new('El lenguas', 20, prize, bad_consequence)

prize = Prize.new(1, 1)
bad_consequence = BadConsequence.new_specific_treasures(
  'Te faltan manos para tanta cabeza. ' \
  'Pierdes 3 niveles y tus tesoros visibles de las manos',
  3,
  [TreasureKind::ONEHAND, TreasureKind::BOTHHANDS],
  []
)
monsters << Monster.new('Bicéfalo', 20, prize, bad_consequence)

def swad_monster_set
  MonsterSet.new(@@swad_monsters)
end
