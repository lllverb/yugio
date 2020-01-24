require "./common"
enemymonsters = [{name: "砦を守る翼竜", attack: 1400, defense: 1200, star: 4}, {name: "デーモンの召喚", attack: 2500, defense: 1200, star: 6}, {name: "ブルーアイズホワイトドラゴン", attack: 3000, defense: 2500, star: 8}]
enemycard1 = Monster.new(enemymonsters[0])
enemycard2 = Monster.new(enemymonsters[1])
enemycard3 = Monster.new(enemymonsters[2])
$enemyhands = []
$enemyfield = []
$enemyhands << enemycard1
$enemyhands << enemycard2
$enemyhands << enemycard3
def enemymainphase(enemyhands, enemyfield)
  puts "\n<相手のメインフェイズ>"
  enemysummon(enemyhands, enemyfield)
  puts "バトルフェイズに進みます"
end

def enemysummon(enemyhands, enemyfield)
  input = rand(enemyhands.length()) - 1
  sleep(0.5)
  enemyfield << enemyhands[input]
  puts "#{enemyhands[input].name}を召喚しました。"
  sleep(0.5)
  enemyhands.delete_at(input)
end

def enemybattlephase(enemyhands, enemyfield)
  puts "\n<バトルフェイズ>"
  enemyfield.each_with_index do |f, i|
    puts "#{i + 1}.#{f.name}: 攻撃力#{f.attack}"
  end
end

def enemyendphase(turncount)
  puts "-------------------------------------"
  puts "------相手のターンを終了します-------"
  puts "-------------------------------------"
  $turncount = turncount + 1
end
