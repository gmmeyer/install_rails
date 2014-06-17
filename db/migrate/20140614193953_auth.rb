class Auth < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :password_digest, :string
    add_column :users, :token, :string
    add_column :users, :admin, :boolean
    add_column :users, :unchanged_password, :boolean
  end
end
