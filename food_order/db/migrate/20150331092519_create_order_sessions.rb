class CreateOrderSessions < ActiveRecord::Migration
  def change
    create_table :order_sessions do |t|
      t.datetime :timecreate
      t.datetime :timelock
      t.integer :totalmoney
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
