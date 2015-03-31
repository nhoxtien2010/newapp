class OrderStore < ActiveRecord::Base
  belongs_to :store
  belongs_to :order_session
end
