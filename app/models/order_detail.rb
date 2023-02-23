class OrderDetail < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :item, optional: true
  enum making_status: { not_making: 0, wating_production: 1, production: 2,don: 3 }
  validates :order_id, presence:true
  validates :item_id, presence:true
  validates :price, presence:true
  validates :amount, presence:true
  validates :making_status, presence:true
end
