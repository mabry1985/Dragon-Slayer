class Inventory < ApplicationRecord
  belongs_to :user
  belongs_to :item



  def equip
    @user = User.find(current_user.id)
    @items = Inventory.where(user_id: @user.id)
    


  end



end
