class Item < ApplicationRecord
  has_many :inventory
  has_many :users, :through => :inventory
end
