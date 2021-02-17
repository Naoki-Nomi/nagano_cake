class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum is_deleted: {退会済み: true, 有効: false}

  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :email, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :last_name, presence: true


  def check_price
    price = cart_items.to_a.sum { |item| item.for_check_price }
    price.to_s(:delimited, delimiter: ',')
  end

  def for_total_price
    cart_items.to_a.sum { |item| item.for_check_price }
  end

end
