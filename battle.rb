class Hero
  def attack(oponent)
  end
end

class Warrior < Hero
  attr_accessor :hp , :armor, :damage, :name
  def initialize(name)
    @name = name
    @hp = 100
    @armor = 25
    @damage = 25
  end
end

class Healer < Hero
  attr_accessor :hp , :armor, :damage, :name
  def initialize(name)
    @name = name
    @hp = 60
    @armor = 0
    @damage = 5
  end
end

class Mage < Hero
  attr_accessor :hp , :armor, :damage, :name
    def initialize(name)
    @name = name
    @hp = 40
    @armor = 0
    @damage = 100
  end
end

class Tank < Hero
  attr_accessor :hp , :armor, :damage, :name
  def initialize(name)
    @name = "Healer"
    @hp = 100
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

    dealth = attacker.damage - defender.damage
    defender.hp = (defender.hp + defender.armor) - dealth 
    puts "You have dealth #{dealth} damage to #{defender.name}. Enemy's HP: #{defender.hp} "
  end
end