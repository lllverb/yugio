require "./common"
require "./myturn"
require "./enemy"
while $turncount < 6 do
  if $turncount % 2 == 1
    if $turncount == 1
      mainphase()
    else
      drawphase()
      mainphase()
      battlephase()
    end
  else
    enemymainphase()
    enemybattlephase()
  end
  endphase()
end
puts "自分のライフポイント#{$lifepoint}"
puts "相手のライフポイント#{$enemylifepoint}"
if $lifepoint > $enemylifepoint
  puts "デュエルに勝利!"
elsif $lifepoint == $enemylifepoint
  puts "デュエルは引き分けだった"
else
  puts "デュエルに負けてしまった。"
end