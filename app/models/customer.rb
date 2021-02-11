class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :cart_items
  has_many :orders, dependent: :destroy

  def check_price
    price = cart_items.to_a.sum { |item| item.for_check_price }
    price.to_s(:delimited, delimiter: ',')
  end

  def for_total_price
    cart_items.to_a.sum { |item| item.for_check_price }
  end

end
