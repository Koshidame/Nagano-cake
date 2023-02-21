class Item < ApplicationRecord
  belongs_to :genre
  has_many :order_details, dependent: :destroy
  has_one_attached :image

  validates :image, presence:true
  validates :name, presence:true
  validates :introduction, presence:true
  validates :genre_id, presence:true
  validates :price, presence:true
  #validates :sales_status, presence:true
end
