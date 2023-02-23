class Order < ApplicationRecord
  belongs_to :customer, optional: true
  has_many :order_details, dependent: :destroy
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: {
    waiting_payment: 0,
    confirm_payment: 1,
    production: 2,
    shipping: 3,
    shipped: 4
    }
  validates :customer_id, presence:true
  validates :postal_code, presence:true
  validates :address, presence:true
  validates :name, presence:true
  validates :shipping_cost, presence:true
  validates :status, presence:true
  validates :total_payment, presence:true
  validates :payment_method, presence:true
end
