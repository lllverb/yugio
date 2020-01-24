require "./common"
require "./enemy"
monsters = [{name: "砦を守る翼竜", attack: 1400, defense: 1200, star: 4}, {name: "デーモンの召喚", attack: 2500, defense: 1200, star: 6}, {name: "ブルーアイズホワイトドラゴン", attack: 3000, defense: 2500, star: 8}]
def mainphase(hands, field)
  puts "--------メインフェイズ--------"
  puts "----------------------------"
  hands.each_with_index do |hand, i|
    puts "手札#{i + 1}: #{hand.name}"
  end
  puts "----------------------------"
  
  summon(hands, field)
  puts "バトルフェイズに進みます"
end

def summon(hands, field)
  puts "どちらを召喚しますか?"
  hands.each_index do |i|
    puts "手札#{i + 1}[#{i + 1}]\n"
  end
  input = gets.to_i - 1
  while input < 0 || hands.length() < input do
    puts "正しい数値を入力してください"
    input = gets.to_i - 1
  end
  field << hands[input]
  puts "#{hands[input].name}を召喚!"
  hands.delete_at(input)
end

def battlephase(hands, field)
  puts "--------バトルフェイズ--------"
  field.each_with_index do |f, i|
    puts "#{i + 1}.#{f.name}: 攻撃力#{f.attack}"
  end
  puts "----------------------------"
end

card1 = Monster.new(monsters[0])
card2 = Monster.new(monsters[1])
card3 = Monster.new(monsters[2])
hands = []
field = []
hands << card1
hands << card2
hands << card3
while $turncount < 5 do
  if $turncount % 2 == 1
    mainphase(hands, field)
    battlephase(hands, field)
    endphase($turncount)
  else
    enemymainphase($enemyhands, $enemyfield)
    enemybattlephase($enemyhands, $enemyfield)
    endphase($turncount)
  end
end