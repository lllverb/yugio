monsters = [{name: "砦を守る翼竜", attack: 100, defense: 1200, star: 4}, {name: "デーモンの召喚", attack: 200, defense: 1200, star: 6}, {name: "ブルーアイズホワイトドラゴン", attack: 3000, defense: 2500, star: 8}]
card1 = Monster.new(monsters[0])
card2 = Monster.new(monsters[1])
card3 = Monster.new(monsters[2])
$hands = []
$field = []
$hands << card1
$hands << card2
$hands << card3
def drawphase
  puts "\n俺のターン、ドロー!"
end
def mainphase()
  puts "\n<メインフェイズ>"
  $hands.each_with_index do |hand, i|
    puts "手札#{i + 1}: #{hand.name}"
  end
  summon()
end

def summon()
  puts "どちらを召喚しますか?"
  summonnumber = gets.to_i
  while summonnumber <= 0 || $hands.length() < summonnumber do
    puts "正しい数値を入力してください"
    summonnumber = gets.to_i
  end
  summonnumber -= 1
  $field << $hands[summonnumber]
  puts "\n#{$hands[summonnumber].name}を召喚!"
  $hands.delete_at(summonnumber)
end

def battlephase()
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
  puts "\nどれで攻撃しますか?"
  attackernumber = gets.to_i
  while attackernumber <= 0 || $field.length() < attackernumber do
    puts "\n正しい数値を入力してください"
    attackernumber = gets.to_i
  end
  attackernumber -= 1
  attacker = $field[attackernumber]
  if $enemyfield.length() != 0
    puts "\nどのモンスターを攻撃しますか?"
    targetnumber = gets.to_i
    while targetnumber <= 0 || $enemyfield.length() < targetnumber do
      puts "\n正しい数値を入力してください"
      targetnumber = gets.to_i
    end
    targetnumber -= 1
    target = $enemyfield[targetnumber]
    damagestep(attacker, target, attackernumber, targetnumber)
  else
    puts "相手にダイレクトアタック!\n#{attacker.attack}のダメージ"
    $enemylifepoint -= attacker.attack
  end
  # 攻撃するモンスターを選択//////////////
end