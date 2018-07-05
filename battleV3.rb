class Arena
  def duel (hero1, hero2, mode)
    if mode == deathmatch
      Mode.Deathmatch
    elsif mode == turnbase
      Mode.Turnbase
    end
  end
end

#---------------------------------------------------------------------------------------------------------------------------------------------
class Hero
  attr_accessor :hp, :armor
  attr_reader :critdmg, :critchance, :name, :damage
end
class Warrior < Hero

  def initialize(name)
    @name = name
    @hp = 100
    @critdmg = 125
    @critchance = 25
    @armor = 25
    @damage = 25
  end
end
class Healer < Hero

  def initialize(name)
    @name = name
    @hp = 60
    @critdmg = 20
    @critchance = 25 
    @armor = 0
    @damage = 5
  end
end
class Mage < Hero

  def initialize(name)
    @name = name
    @hp = 40
    @critdmg = 100
    @critchance = 80 
    @armor = 0
    @damage = 100
  end
end
class Tank < Hero
  def initialize(name)
    @name = name
    @hp = 100
    @critdmg = 20
    @critchance = 50
    @armor = 100
    @damage = 0.5
  end
end
#---------------------------------------------------------------------------------------------------------------------------------------------

class Mode 

  def Deathmatch (hero1, hero2)
    attack = rand(1..2)
    if attack == 1
      attacker = hero1
      defender = hero2
    elsif attack == 2
      attacker = hero2
      defender = hero1
    end

    puts "Attacker #{attacker.name} ||V.S Defender|| #{defender.name}"

    chance = rand(24..90)
    if chance >= attacker.critchance
      dealth = attacker.critdmg + attacker.damage - defender.damage
      defender.armor = dealth - defender.armor
      defender.hp = (defender.hp + defender.armor) - dealth
    elsif chance != attacker.critchance
      dealth = attacker.damage - defender.damage
      defender.armor = dealth - defender.armor
      defender.hp = (defender.hp + defender.armor) - dealth
    end
    puts "#{attacker.name} have dealth #{dealth} damage to #{defender.name}. Enemy's HP: #{defender.hp} "
    puts "crit chance #{attacker.critchance}% critical damage #{attacker.critdmg}"
    if defender.hp <= 0
      puts "Game over. #{attacker.name} Win"
    else
    end
  end
  def Turnbase (hero1, hero2)
    limit = 5;
 

    attack = rand(1..2)
    if attack == 1
      attacker = hero1
      defender = hero2
      turnlimit = attacker - limit
    elsif attack == 2
      attacker = hero2
      defender = hero1
      turnlimit = attacker - limit
    end
    

    puts "Attacker #{attacker.name} ||V.S Defender|| #{defender.name}"
    puts "#{attacker.name} turns left #{turnlimit}."

    chance = rand(24..90)
    if chance >= attacker.critchance
      dealth = attacker.critdmg + attacker.damage - defender.damage
      defender.armor = dealth - defender.armor
      defender.hp = (defender.hp + defender.armor) - dealth
    elsif chance != attacker.critchance
      dealth = attacker.damage - defender.damage
      defender.armor = dealth - defender.armor
      defender.hp = (defender.hp + defender.armor) - dealth
    end
    puts "#{attacker.name} have dealth #{dealth} damage to #{defender.name}. Enemy's HP: #{defender.hp} "
    puts "crit chance #{attacker.critchance}% critical damage #{attacker.critdmg}"
    if defender.hp <= 0
      puts "Game over. #{attacker.name} Win"
    elsif limit == 0
      puts "Game over"
    end
  end

end
