class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum making_status: { not_making: 0, wating_production: 1, production: 2,don: 3 }
end
