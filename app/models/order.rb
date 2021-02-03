class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_items, dependent: :destroy

  enum payment_method: { credit: 0, bank: 1 }
  enum status: { pending: 0, recipt: 1, making: 2, preparation: 3, shipped: 4 }

end
