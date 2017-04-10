class RenameCharacterClassColumn < ActiveRecord::Migration
  def change
    rename_column :characters, :class, :charclass
  end
end
