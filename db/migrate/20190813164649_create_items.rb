class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :strength
      t.integer :speed
      t.integer :health
      t.integer :durability
    end
  end
end
