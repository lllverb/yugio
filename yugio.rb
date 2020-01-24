monsters = [{name: "砦を守る翼竜", attack: 1400, defense: 1200, star: 4}, {name: "デーモンの召喚", attack: 2500, defense: 1200, star: 6}, {name: "ブルーアイズホワイトドラゴン", attack: 3000, defense: 2500, star: 8}]

lifepoint = 8000
enemylifepoint = 8000
class Monster
  attr_accessor :name, :attack, :defense, :star
  def initialize(**params)
    @name = params[:name]
    @attack = params[:attack]
    @defense = params[:defense]
    @star = params[:star]
  end
end

def mainphase(hands, field)
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
  input = gets.to_i
  field << hands[input - 1]
  hands.delete_at(input  - 1)
  puts "#{hands[input - 1].name}を召喚!"
end

def battlephase(hands, field)
  puts field[0].name
end

card1 = Monster.new(monsters[0])
card2 = Monster.new(monsters[1])
card3 = Monster.new(monsters[2])
hands = []
field = []
hands << card1
hands << card2
hands << card3
mainphase(hands, field)
battlephase(hands, field)
