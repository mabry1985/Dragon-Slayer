class AddGoldToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column(:users, :gold, :integer, default: 20)
  end
end
