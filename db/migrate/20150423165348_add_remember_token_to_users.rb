class AddRememberTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :remember_digest, :string
    add_column :users, :remembered_at, :datetime
  end
end
