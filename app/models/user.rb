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
end
