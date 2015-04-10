class AddFieldsToUsers < ActiveRecord::Migration
  def change

    add_column :users, :name, :string
    add_column :users, :gender, :boolean
    add_column :users, :profile_picture, :string    
  end
end
