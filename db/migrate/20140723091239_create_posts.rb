class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :blog

      t.timestamps
    end
  end
end
