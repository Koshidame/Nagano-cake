class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  has_one_attached :image
  
  validates :item_id, :quantity, presence: true
  validates :quantity, numericality:{ only_integer: true }
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpg')
    end
  end
  
  def line_total
    item.price * quantity
  end
end
