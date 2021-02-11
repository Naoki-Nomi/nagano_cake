class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_items, dependent: :destroy
  accepts_nested_attributes_for :order_items

  enum delivery_option: { self_address: 0, register_address: 1, form_address: 2 }
  enum payment_method: { credit: 0, bank: 1 }
  enum status: { pending: 0, recipt: 1, making: 2, preparation: 3, shipped: 4 }

end
