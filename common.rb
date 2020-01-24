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