class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :location
      t.string :website
      t.string :boi
      t.integer :mobile_number
      t.string :profile_name
      t.string :email

      t.timestamps
    end
  end
end
