require "./common"
enemymonsters = [{name: "エルフの剣士", attack: 1400, defense: 1200, star: 4}, {name: "ホーリーエルフ", attack: 800, defense: 2000, star: 6}, {name: "レッドアイズブラックドラゴン", attack: 2400, defense: 2000, star: 7}]
enemycard1 = Monster.new(enemymonsters[0])
enemycard2 = Monster.new(enemymonsters[1])
enemycard3 = Monster.new(enemymonsters[2])
$enemyhands = []
$enemyfield = []
$enemyhands << enemycard1
$enemyhands << enemycard2
$enemyhands << enemycard3
def enemymainphase()
  puts "\n<相手のメインフェイズ>"
  enemysummon()
end

def enemysummon()
  input = rand($enemyhands.length()) - 1
  sleep(0.5)
  $enemyfield << $enemyhands[input]
  puts "#{$enemyhands[input].name}を召喚しました。"
  sleep(0.5)
  $enemyhands.delete_at(input)
end


def enemybattlephase()
  puts "バトルフェイズに進みます"
  puts "\n<バトルフェイズ>"
  puts "-----自分フィールド-----"
  $field.each_with_index do |f, i|
    puts "#{i + 1}.#{f.name}: 攻撃力#{f.attack}"
  end
  if $enemyfield.length() != 0
    puts "-----相手フィールド-----"
    $enemyfield.each_with_index do |ef, i|
      puts "#{i + 1}.#{ef.name}: 攻撃力#{ef.attack}"
    end
  end
  # 攻撃するモンスターを選択//////////////
  attackernumber = rand($enemyfield.length())
  attacker = $enemyfield[attackernumber]
  targetnumber = rand($field.length())
  target = $field[targetnumber]
  puts "#{attacker.name}\nVS\n#{target.name}"
  damagestep(target, attacker, attackernumber, targetnumber)
  # 攻撃するモンスターを選択//////////////
end
