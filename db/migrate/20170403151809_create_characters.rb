class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :label
      t.int :index
      t.int :userid
      t.string :name
      t.int :class
      t.int :race
      t.string :stats

      t.timestamps null: false
    end
  end
end
