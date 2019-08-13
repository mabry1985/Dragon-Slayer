class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :strength, default: 0
      t.integer :speed, default: 0
      t.integer :health, default: 0
      t.integer :durability, default: 10
    end
  end
end
