class AddEnemiesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :enemies do |t|
      t.string :type
      t.integer :strength
      t.integer :speed
      t.integer :health
      t.integer :gold
      t.integer :xp

      t.timestamps
    end
  end
end
