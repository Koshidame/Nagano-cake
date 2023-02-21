class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :image
  
  has_many :cart_items

  validates :image, presence:true
  validates :name, presence:true
  validates :introduction, presence:true
  validates :genre_id, presence:true
  validates :price, presence:true
  #validates :sales_status, presence:true
  
  def taxin_price
    price*1.1
  end
end
