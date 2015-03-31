class CreateOrderStores < ActiveRecord::Migration
  def change
    create_table :order_stores do |t|
      t.references :store, index: true, foreign_key: true
      t.references :order_session, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
