class AddColumnCarrierToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :carrier, :string
  end
end
