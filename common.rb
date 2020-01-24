$lifepoint = 8000
$enemylifepoint = 8000
$turncount = 1
class Monster
  attr_accessor :name, :attack, :defense, :star
  def initialize(**params)
    @name = params[:name]
    @attack = params[:attack]
    @defense = params[:defense]
    @star = params[:star]
  end
end


def damagestep(attacker, target, attackernumber, targetnumber)
  if attacker.attack > target.attack
    damage = attacker.attack - target.attack
    puts "\n撃破!相手に#{damage}のダメージ!"
    $enemylifepoint -= damage
    $enemyfield.delete_at(targetnumber)
  elsif attacker.attack == target.attack
    puts "相打ちだ!"
    $field.delete_at(attackernumber)
    $enemyfield.delete_at(targetnumber)
  else
    damage = target.attack - attacker.attack
    puts "戦闘に負けてしまった。#{damage}のダメージ。"
    $lifepoint -= damage
    $field.delete_at(attackernumber)
  end
end


def endphase()
  if $turncount % 2 == 1
    puts "-------------------------------------"
    puts "------自分のターンを終了します-------"
    puts "-------------------------------------"
  else 
    puts "-------------------------------------"
    puts "------相手のターンを終了します-------"
    puts "-------------------------------------"
  end
  $turncount += 1
end