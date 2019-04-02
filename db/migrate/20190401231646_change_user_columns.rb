class ChangeUserColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string, unique: true #null:false
    remove_column :users, :name
    remove_column :users, :email
  end
end
