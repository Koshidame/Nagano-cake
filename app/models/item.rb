class Item < ApplicationRecord
  belongs_to :genre
  belongs_to :order
  has_many :order_details, dependent: :destroy
  has_one_attached :image
  
  has_many :cart_items, dependent: :destroy

  validates :image, presence:true
  validates :name, presence:true
  validates :introduction, presence:true
  validates :genre_id, presence:true
  validates :price, presence:true
  #validates :sales_status, presence:true
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
  
  def taxin_price
    price*1.1
  end
end
