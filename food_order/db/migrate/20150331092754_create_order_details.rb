class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.references :user, index: true, foreign_key: true
      t.references :food, index: true, foreign_key: true
      t.integer :number
      t.integer :totalmoney
      t.references :order_session, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
