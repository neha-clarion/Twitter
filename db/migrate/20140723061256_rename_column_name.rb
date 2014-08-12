class RenameColumnName < ActiveRecord::Migration
  def change
    rename_column :profiles, :boi, :bio
  end
end
