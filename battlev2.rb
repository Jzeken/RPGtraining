class Hero
  attr_accessor :hp, :armor
  attr_reader :critdmg, :critchance, :name, :damage
end

class Warrior < Hero
  attr_accessor :hp , :armor, :damage, :name, :critdmg, :critchance
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
  attr_accessor :hp , :armor, :damage, :name, :critdmg, :critchance
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
  attr_accessor :hp , :armor, :damage, :name, :critdmg, :critchance
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
  attr_accessor :hp , :armor, :damage, :name, :critdmg, :critchance
  def initialize(name)
    @name = name
    @hp = 100
    @critdmg = 20
    @critchance = 50
    @armor = 100
    @damage = 0.5
  end
end

class Arena
  def duel(hero1,hero2)

    attack = rand(1..2)
    if attack == 1
      attacker = hero1
      defender = hero2
    elsif attack == 2
      attacker = hero2
      defender = hero1
    end

    puts "Attacker #{attacker.name} : #{attacker.hp + attacker.armor} ||V.S Defender|| #{defender.name} : #{defender.hp + defender.armor}"

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

    #        if chance == attacker.critchance
    #            newdamage =  attacker.damage + attacker.critdmg
    #        end

    #        dealth = attacker.damage - defender.damage
    #        defender.hp = (defender.hp + defender.armor) - dealth
    puts "#{attacker.name} have dealth #{dealth} damage to #{defender.name}. Enemy's HP: #{defender.hp} "
    puts "crit chance #{chance} critical damage #{attacker.critdmg}"
  end
end