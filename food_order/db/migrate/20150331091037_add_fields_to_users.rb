class AddFieldsToUsers < ActiveRecord::Migration
  def change

    add_column :users, :name, :string
    add_column :users, :gender, :boolean
    add_column :users, :profile_picture, :string
    add_column :users, :permission, :integer
  end
end
