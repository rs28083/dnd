class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :label
      t.integer :index
      t.integer :userid
      t.string :name
      t.integer :class
      t.integer :race
      t.string :stats

      t.timestamps null: false
    end
  end
end
