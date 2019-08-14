class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :inventory
  has_many :items, :through => :inventory

  def default
    user = User.find(self.id)
    user.update(:strength => 5, :speed => 5, :health => 50)
  end

  def equip
     user = User.find(self.id)
     items = Inventory.where(user_id: user.id)
     items.each do |item|
      item_add = Item.find(id = item.item_id)
       user.strength += item_add.strength
       user.speed += item_add.speed
       user.health += item_add.health
       user.update(:strength => user.strength, :speed => user.speed, :health => user.health)
    end
  end

  def add_item
    user = User.find(self.id)
    item = Item.find(@item.id)
    item.users.push(user)
    item.save
  end

  def fight
    user = User.find(self.id)
    enemy = Enemy.find(1)
    enemy_attack = user.health -= enemy.strength
    user_attack = enemy.health -= user.strength
    if user.speed > enemy.speed
      enemy_attack
      user_attack
      user_attack
    elsif user.speed < enemy.speed
      enemy_attack
      user_attack
    else
      enemy_attack
      user_attack
    end
    user.update(:health => user.health)
    enemy.update(:health => enemy.health)
  if enemy.health <= 0
    user.gold += enemy.gold
    user.xp += enemy.xp
  elsif user.health <= 0
    user.default
    items = Inventory.where(user_id: user.id)
    items.each do |item|
      item.destroy
   end
  end
  end
end
