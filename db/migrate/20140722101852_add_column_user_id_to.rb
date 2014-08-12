class AddColumnUserIdTo < ActiveRecord::Migration
  def change
    add_column :profiles, :user_id, :integer
  end

  def down
  end
end
