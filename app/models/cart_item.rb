class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  has_one_attached :image
  
  validates :item_id, presence: true
  validates :amount, numericality:{ only_integer: true }
  
  
  
  def sub_total
    item.price * amount
  end
end
