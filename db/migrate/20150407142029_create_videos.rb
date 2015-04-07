class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :uuid
      t.string :title
      t.string :description
      t.string :poster_url
      t.string :poster_large_url
      t.float :rate

      t.timestamps null: false
    end
    add_index :videos, :uuid, unique: true
  end
end
