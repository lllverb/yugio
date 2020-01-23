class Monster
  attr_accessor :name, :attack, :defense, :star
  def initialize(**params)
    @name = params[:name]
    @attack = params[:attack]
    @defense = params[:defense]
    @star = params[:star]
  end
end

def mainphase(hands)
  puts "----------------------------"
  hands.each_with_index do |hand, i|
    puts "手札#{i + 1}: #{hand.name}"
  end
  puts "----------------------------"
  puts "どちらを召喚しますか?"
  puts "手札1:[1]\n手札2:[2]"
  input = gets.to_i
  summon(hands, input)
  puts "バトルフェイズに進みます"
end

def summon(hands, input)
  puts "#{hands[input - 1].name}を召喚!"
end

monsters = [{name: "砦を守る翼竜", attack: 1400, defense: 1200, star: 4}, {name: "デーモンの召喚", attack: 2500, defense: 1200, star: 6}]
card1 = Monster.new(monsters[0])
card2 = Monster.new(monsters[1])
hands = []
hands << card1
hands << card2
mainphase(hands)

