class OrderDetail < ActiveRecord::Base
  belongs_to :user
  belongs_to :food
  belongs_to :order_session
end
