class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  
  validates :last_name,presence: true
  validates :first_name,presence: true
  validates :first_name_kana, :last_name_kana, presence: true,format: { with: /\A([ァ-ン]|ー)+\z/, message: "はカタカナで入力してください" }
  validates :telephone_number,format: { with: /\A[0-9]{10,11}+\z/, message: 'は10桁以上11桁以内の半角数値で入力してください' }
  validates :postal_code,presence: true
  validates :address,presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,message: "は正しいフォーマットで入力してください" }, uniqueness: { message: "このアドレスは使用できません"}
  validates :password, presence: true, length: { minimum: 6 }, on: :update, allow_blank: true

  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  
end
